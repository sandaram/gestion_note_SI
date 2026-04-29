on va creer un SI pour gerer les notes d'etudiants.
Les notes sont partagees par semestres
Chaque semestre a au moins une option de parcours
chaque option de parcours a plusieurs unites avec ses credits (coefficients)
et chaque unite a une ou plusieurs matieres 

donc pour : stocker et gerer les notes par etudiant pour chaque semestre (chaque etudiant fait tous les matieres, mais les matieres sont apres regroupes en option pour peut etre savoir quelle option correspond mieux a l'etudiant)
on propose cette conception pour la base de donnee :

Semestre {
    id int primary key auto_increment,
    nom varchar(50)
}
OptionParcours{
    id,
    idSemestre,
    parcours (lable),
    responsable (varchar (50))
}
Matiere{
    id
    nom
}
Unite{
    id
    nom (optional)
    nomMatiere1 (optional ?)
    credits
}
MatieresUnite {
    id
    idUnite
    idMatiere
}
Etudiant{
    id
    nom
    prenom
    etu
}
Note {
    id
    idEtudiant 
    idSemestre
    idMatiere
    Note
}

generate the sql script to create the gestionNoteDB database, and create these tables with the data types you think is okay for them



