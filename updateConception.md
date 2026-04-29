on va creer un SI pour gerer les notes d'etudiants.
Les notes sont partagees par semestres
Chaque semestre a au moins une option de parcours
chaque option de parcours a plusieurs unites avec ses credits (coefficients)
aussi, il se peut que dans une unite , il y ait un choix de matiere

donc pour : stocker et gerer les notes par etudiant pour chaque semestre (avec sa propre option de parcours par semestre)
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
Note{
    id
    idEtudiant 
    idSemestre
    idMatiere
    Note
}




