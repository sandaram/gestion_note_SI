<?php

namespace App\Controllers;

use App\Models\ProduitModel;

class Produit extends BaseController
{
    
     public function index(): string
    {
        $model = new ProduitModel();
        $data['produits'] = $model->findAll();
        return view('produit', $data);
        //return view('produit');
        //return "Liste des produits";
    }
}
