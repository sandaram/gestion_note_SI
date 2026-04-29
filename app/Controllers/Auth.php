<?php

namespace App\Controllers;

use App\Models\UserModel;

class Auth extends BaseController
{
    public function login()
    {
        if (session()->get('isLoggedIn')) {
            return redirect()->to(site_url('/'));
        }

        if ($this->request->getMethod() !== 'post') {
            return view('auth/login', [
                'title'          => 'Login',
                'defaultEmail'   => 'admin@example.com',
                'defaultPassword'=> 'admin123',
            ]);
        }

        $email    = trim((string) $this->request->getPost('email'));
        $password = (string) $this->request->getPost('password');

        if ($email === '' || $password === '') {
            return redirect()->back()->withInput()->with('error', 'Email et mot de passe requis.');
        }

        $userModel = new UserModel();
        $user      = $userModel->where('email', $email)->first();

        if (!$user || !password_verify($password, (string) $user['password_hash'])) {
            return redirect()->back()->withInput()->with('error', 'Identifiants invalides.');
        }

        session()->regenerate(true);
        session()->set([
            'isLoggedIn' => true,
            'user_id'    => (int) $user['id'],
            'user_email' => (string) $user['email'],
        ]);

        return redirect()->to(site_url('/'));
    }

    public function logout()
    {
        session()->destroy();
        return redirect()->to(site_url('/login'));
    }
}
