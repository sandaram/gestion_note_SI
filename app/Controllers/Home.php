<?php

namespace App\Controllers;

class Home extends BaseController
{
    public function index()
    {
        if (session()->get('isLoggedIn')) {
            return redirect()->to(site_url('/etudiants'));
        }

        return redirect()->to(site_url('/login'));
    }
    
}
