-- ======================
-- SEMESTRE 3 COMPLET
-- ======================

-- 1. Semestre
INSERT INTO Semestre (nom) VALUES ('S3');

-- 2. Option unique du S3
INSERT INTO OptionParcours (idSemestre, parcours, responsable)
VALUES (
	(SELECT id FROM Semestre WHERE nom = 'S3' LIMIT 1),
	'S3 - Tronc Commun',
	'RESP_S3'
);

-- 3. Matières
INSERT INTO Matiere (nom) VALUES
('Programmation Oriente Objet'),
('Base de Donnees Objet'),
('Programmation Systeme'),
('Reseaux Informatique'),
('Methodes numeriques'),
('Base de Gestion');

-- 4. Unités (1 matière par unité avec crédits)
INSERT INTO Unite (nom, credits) VALUES
('U1 - POO', 6),
('U2 - BDO', 6),
('U3 - Systeme', 4),
('U4 - Reseaux', 6),
('U5 - Methodes Num', 4),
('U6 - Gestion', 4);

-- 5. Liaison Option ↔ Unité
INSERT INTO OptionUnite (idOptionParcours, idUnite)
SELECT op.id, u.id
FROM OptionParcours op
JOIN Unite u ON u.nom IN (
	'U1 - POO',
	'U2 - BDO',
	'U3 - Systeme',
	'U4 - Reseaux',
	'U5 - Methodes Num',
	'U6 - Gestion'
)
WHERE op.parcours = 'S3 - Tronc Commun';

-- 6. Liaison Unité ↔ Matière (1–1)
INSERT INTO MatieresUnite (idUnite, idMatiere)
SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON u.nom = 'U1 - POO' AND m.nom = 'Programmation Oriente Objet'

UNION ALL

SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON u.nom = 'U2 - BDO' AND m.nom = 'Base de Donnees Objet'

UNION ALL

SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON u.nom = 'U3 - Systeme' AND m.nom = 'Programmation Systeme'

UNION ALL

SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON u.nom = 'U4 - Reseaux' AND m.nom = 'Reseaux Informatique'

UNION ALL

SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON u.nom = 'U5 - Methodes Num' AND m.nom = 'Methodes numeriques'

UNION ALL

SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON u.nom = 'U6 - Gestion' AND m.nom = 'Base de Gestion';

-- ======================
-- SEMESTRE 4 - OPTION DEV
-- ======================

-- 1. Semestre
INSERT INTO Semestre (nom) VALUES ('S4');

-- 2. Option (on ne cree que l'option dev pour le moment)
INSERT INTO OptionParcours (idSemestre, parcours, responsable)
VALUES (
	(SELECT id FROM Semestre WHERE nom = 'S4' LIMIT 1),
	'S4 - Option Dev',
	'Razafinjoelina Tahina'
);

-- 3. Matieres du S4 (reutilisables ensuite pour les autres options)
INSERT INTO Matiere (nom) VALUES
('SIG'),
('SI'),
('IHM'),
('Algo'),
('Mini-Projet de developpment'),
('Geometrie'),
('Equation diff'),
('Optimisation'),
('MAO');

-- 4. Unites (5 unites)
INSERT INTO Unite (nom, credits) VALUES
('U1 - Dev Fondamentaux', 8),
('U2 - Algo', 4),
('U3 - Mini-Projet Dev', 4),
('U4 - Mathematiques', 8),
('U5 - MAO', 4);

-- 5. Liaison Option ↔ Unité
INSERT INTO OptionUnite (idOptionParcours, idUnite)
SELECT op.id, u.id
FROM OptionParcours op
JOIN Unite u ON u.nom IN (
	'U1 - Dev Fondamentaux',
	'U2 - Algo',
	'U3 - Mini-Projet Dev',
	'U4 - Mathematiques',
	'U5 - MAO'
)
WHERE op.parcours = 'S4 - Option Dev';

-- 6. Liaison Unite ↔ Matiere
INSERT INTO MatieresUnite (idUnite, idMatiere)
SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON m.nom IN ('SIG', 'SI', 'IHM')
WHERE u.nom = 'U1 - Dev Fondamentaux'

UNION ALL

SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON m.nom = 'Algo'
WHERE u.nom = 'U2 - Algo'

UNION ALL

SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON m.nom = 'Mini-Projet de developpment'
WHERE u.nom = 'U3 - Mini-Projet Dev'

UNION ALL

SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON m.nom IN ('Geometrie', 'Equation diff', 'Optimisation')
WHERE u.nom = 'U4 - Mathematiques'

UNION ALL

SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON m.nom = 'MAO'
WHERE u.nom = 'U5 - MAO';

-- ======================
-- SEMESTRE 4 - OPTION BDR
-- ======================

-- 1. Option BDR
INSERT INTO OptionParcours (idSemestre, parcours, responsable)
VALUES (
	(SELECT id FROM Semestre WHERE nom = 'S4' LIMIT 1),
	'S4 - Bases de Donnees et Reseaux',
	'Rakotomalala Vahatriniaina'
);

-- 2. Matieres supplementaires (si absentes)
INSERT INTO Matiere (nom)
SELECT 'Analyse des donnees'
WHERE NOT EXISTS (SELECT 1 FROM Matiere WHERE nom = 'Analyse des donnees');

INSERT INTO Matiere (nom)
SELECT 'Mini-projet de bases de donnees et/ou de reseaux'
WHERE NOT EXISTS (SELECT 1 FROM Matiere WHERE nom = 'Mini-projet de bases de donnees et/ou de reseaux');

-- 3. Unites (5 unites)
INSERT INTO Unite (nom, credits) VALUES
('U1 - BDR SI', 6),
('U2 - BDR Fondamentaux', 6),
('U3 - BDR Mini-Projet', 10),
('U4 - BDR Mathematiques', 4),
('U5 - BDR MAO', 4);

-- 4. Liaison Option ↔ Unité
INSERT INTO OptionUnite (idOptionParcours, idUnite)
SELECT op.id, u.id
FROM OptionParcours op
JOIN Unite u ON u.nom IN (
	'U1 - BDR SI',
	'U2 - BDR Fondamentaux',
	'U3 - BDR Mini-Projet',
	'U4 - BDR Mathematiques',
	'U5 - BDR MAO'
)
WHERE op.parcours = 'S4 - Bases de Donnees et Reseaux';

-- 5. Liaison Unite ↔ Matiere
INSERT INTO MatieresUnite (idUnite, idMatiere)
SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON m.nom = 'SI'
WHERE u.nom = 'U1 - BDR SI'

UNION ALL

SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON m.nom IN ('SIG', 'IHM', 'Algo')
WHERE u.nom = 'U2 - BDR Fondamentaux'

UNION ALL

SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON m.nom = 'Mini-projet de bases de donnees et/ou de reseaux'
WHERE u.nom = 'U3 - BDR Mini-Projet'

UNION ALL

SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON m.nom IN ('Analyse des donnees', 'Equation diff', 'Optimisation')
WHERE u.nom = 'U4 - BDR Mathematiques'

UNION ALL

SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON m.nom = 'MAO'
WHERE u.nom = 'U5 - BDR MAO';

-- ======================
-- SEMESTRE 4 - OPTION WEB ET DESIGN
-- ======================

-- 1. Option Web et Design
INSERT INTO OptionParcours (idSemestre, parcours, responsable)
VALUES (
	(SELECT id FROM Semestre WHERE nom = 'S4' LIMIT 1),
	'S4 - Web et Design',
	'Rabenahary Rojo'
);

-- 2. Matieres supplementaires (si absentes)
INSERT INTO Matiere (nom)
SELECT 'Web dynamique'
WHERE NOT EXISTS (SELECT 1 FROM Matiere WHERE nom = 'Web dynamique');

INSERT INTO Matiere (nom)
SELECT 'Mini-projet de Web et design'
WHERE NOT EXISTS (SELECT 1 FROM Matiere WHERE nom = 'Mini-projet de Web et design');

-- 3. Unites (5 unites)
INSERT INTO Unite (nom, credits) VALUES
('U1 - Web Design Fondamentaux', 6),
('U2 - Web Dynamique', 6),
('U3 - Web Design Mini-Projet', 10),
('U4 - Web Design Mathematiques', 4),
('U5 - Web Design MAO', 4);

-- 4. Liaison Option ↔ Unité
INSERT INTO OptionUnite (idOptionParcours, idUnite)
SELECT op.id, u.id
FROM OptionParcours op
JOIN Unite u ON u.nom IN (
	'U1 - Web Design Fondamentaux',
	'U2 - Web Dynamique',
	'U3 - Web Design Mini-Projet',
	'U4 - Web Design Mathematiques',
	'U5 - Web Design MAO'
)
WHERE op.parcours = 'S4 - Web et Design';

-- 5. Liaison Unite ↔ Matiere
INSERT INTO MatieresUnite (idUnite, idMatiere)
SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON m.nom IN ('SIG', 'SI', 'IHM')
WHERE u.nom = 'U1 - Web Design Fondamentaux'

UNION ALL

SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON m.nom = 'Web dynamique'
WHERE u.nom = 'U2 - Web Dynamique'

UNION ALL

SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON m.nom = 'Mini-projet de Web et design'
WHERE u.nom = 'U3 - Web Design Mini-Projet'

UNION ALL

SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON m.nom IN ('Analyse des donnees', 'Geometrie', 'Optimisation')
WHERE u.nom = 'U4 - Web Design Mathematiques'

UNION ALL

SELECT u.id, m.id
FROM Unite u
JOIN Matiere m ON m.nom = 'MAO'
WHERE u.nom = 'U5 - Web Design MAO';

-- admin / admin123
INSERT INTO Users (email, username, password_hash) VALUES
('admin@gestionnote.com', 'admin', '$2a$10$DEFAULT_BCRYPT_HASH');