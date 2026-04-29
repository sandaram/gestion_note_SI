CREATE DATABASE gestionNoteDB;
USE gestionNoteDB;

-- =====================================
-- TABLE : Semestre
-- =====================================
CREATE TABLE Semestre (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE
);

-- =====================================
-- TABLE : OptionParcours
-- Chaque option appartient à un semestre
-- =====================================
CREATE TABLE OptionParcours (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idSemestre INT NOT NULL,
    parcours VARCHAR(100) NOT NULL,
    responsable VARCHAR(100),

    CONSTRAINT fk_option_semestre
        FOREIGN KEY (idSemestre)
        REFERENCES Semestre(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =====================================
-- TABLE : Matiere
-- =====================================
CREATE TABLE Matiere (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL UNIQUE
);

-- =====================================
-- TABLE : Unite
-- Chaque unité a un coefficient / crédit
-- =====================================
CREATE TABLE Unite (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    credits INT NOT NULL CHECK (credits > 0)
);

-- =====================================
-- TABLE : MatieresUnite
-- Relation N-N entre Unite et Matiere
-- Une unité contient une ou plusieurs matières
-- =====================================
CREATE TABLE MatieresUnite (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idUnite INT NOT NULL,
    idMatiere INT NOT NULL,

    CONSTRAINT fk_mu_unite
        FOREIGN KEY (idUnite)
        REFERENCES Unite(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_mu_matiere
        FOREIGN KEY (idMatiere)
        REFERENCES Matiere(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT uq_unite_matiere
        UNIQUE (idUnite, idMatiere)
);

-- =====================================
-- TABLE : OptionUnite
-- Une option de parcours contient plusieurs unités
-- =====================================
CREATE TABLE OptionUnite (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idOptionParcours INT NOT NULL,
    idUnite INT NOT NULL,

    CONSTRAINT fk_ou_option
        FOREIGN KEY (idOptionParcours)
        REFERENCES OptionParcours(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_ou_unite
        FOREIGN KEY (idUnite)
        REFERENCES Unite(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT uq_option_unite
        UNIQUE (idOptionParcours, idUnite)
);

-- =====================================
-- TABLE : Etudiant
-- =====================================
CREATE TABLE Etudiant (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    etu VARCHAR(50) NOT NULL UNIQUE
);

-- =====================================
-- TABLE : Note
-- Notes obtenues par étudiant pour une matière d’un semestre
-- =====================================
CREATE TABLE Note (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idEtudiant INT NOT NULL,
    idSemestre INT NOT NULL,
    idMatiere INT NOT NULL,
    note DECIMAL(5,2) NOT NULL CHECK (note >= 0 AND note <= 20),

    CONSTRAINT fk_note_etudiant
        FOREIGN KEY (idEtudiant)
        REFERENCES Etudiant(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_note_semestre
        FOREIGN KEY (idSemestre)
        REFERENCES Semestre(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_note_matiere
        FOREIGN KEY (idMatiere)
        REFERENCES Matiere(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT uq_note_unique
        UNIQUE (idEtudiant, idSemestre, idMatiere)
);

CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(190) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);