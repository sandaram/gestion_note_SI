-- Suppression si existant (ordre important à cause des FK)
DROP TABLE IF EXISTS Note;
DROP TABLE IF EXISTS Inscription;
DROP TABLE IF EXISTS OptionUnite;
DROP TABLE IF EXISTS Unite;
DROP TABLE IF EXISTS Matiere;
DROP TABLE IF EXISTS OptionParcours;
DROP TABLE IF EXISTS Etudiant;
DROP TABLE IF EXISTS Semestre;

-- ======================
-- TABLES PRINCIPALES
-- ======================

CREATE TABLE Semestre (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);

CREATE TABLE Etudiant (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    etu VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE OptionParcours (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idSemestre INT NOT NULL,
    parcours VARCHAR(100) NOT NULL,
    responsable VARCHAR(100),

    FOREIGN KEY (idSemestre) REFERENCES Semestre(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Matiere (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE Unite (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    nomMatiere1 VARCHAR(100),
    credits INT NOT NULL
);

CREATE TABLE OptionUnite (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idUnite INT NOT NULL,
    idMatiere INT NOT NULL,

    FOREIGN KEY (idUnite) REFERENCES Unite(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (idMatiere) REFERENCES Matiere(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ======================
-- INSCRIPTION
-- ======================

CREATE TABLE Inscription (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idEtudiant INT NOT NULL,
    idSemestre INT NOT NULL,
    idOptionParcours INT NOT NULL,

    FOREIGN KEY (idEtudiant) REFERENCES Etudiant(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (idSemestre) REFERENCES Semestre(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (idOptionParcours) REFERENCES OptionParcours(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ======================
-- NOTES
-- ======================

CREATE TABLE Note (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idEtudiant INT NOT NULL,
    idSemestre INT NOT NULL,
    -- idOptionParcours INT NOT NULL,
    idMatiere INT NOT NULL,
    note DECIMAL(5,2) NOT NULL,

    FOREIGN KEY (idEtudiant) REFERENCES Etudiant(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (idSemestre) REFERENCES Semestre(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (idOptionParcours) REFERENCES OptionParcours(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (idMatiere) REFERENCES Matiere(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);