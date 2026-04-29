<?php

namespace App\Controllers;

use App\Models\EtudiantModel;
use CodeIgniter\Database\Exceptions\DatabaseException;

class Etudiants extends BaseController
{
    public function index()
    {
        $db = db_connect();

        if (method_exists($db, 'tableExists') && !$db->tableExists('Etudiant')) {
            return view('etudiants/index', [
                'title'     => 'Etudiants',
                'etudiants' => [],
                'error'     => "Table 'Etudiant' introuvable. Importe d'abord `sql/vrai-init.sql` puis `sql/insert.sql` dans la base configurée.",
            ]);
        }

        try {
            $model = new EtudiantModel();

            return view('etudiants/index', [
                'title'     => 'Etudiants',
                'etudiants' => $model->orderBy('id', 'ASC')->findAll(),
            ]);
        } catch (DatabaseException $e) {
            return view('etudiants/index', [
                'title'     => 'Etudiants',
                'etudiants' => [],
                'error'     => 'Erreur base de données: ' . $e->getMessage(),
            ]);
        }
    }
}
