<?php

namespace App\Models;

use CodeIgniter\Model;

class EtudiantModel extends Model
{
    protected $table            = 'Etudiant';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;

    protected $returnType = 'array';

    protected $allowedFields = [
        'nom',
        'prenom',
        'etu',
    ];
}

