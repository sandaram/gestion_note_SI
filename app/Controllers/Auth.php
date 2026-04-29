<?php

namespace App\Controllers;

use App\Models\UserModel;
use CodeIgniter\Database\Exceptions\DatabaseException;

class Auth extends BaseController
{
    private function findUserByEmail(string $email): ?array
    {
        // Some MySQL setups are case-sensitive on table names (Linux).
        // Support both `Users` (from vrai-init.sql) and `users` (older init.sql).
        $db = db_connect();

        foreach (['Users', 'users'] as $table) {
            try {
                if (method_exists($db, 'tableExists') && !$db->tableExists($table)) {
                    continue;
                }

                $row = $db->table($table)->where('email', $email)->get(1)->getRowArray();
                if ($row) {
                    return $row;
                }
            } catch (DatabaseException) {
                // table doesn't exist or schema mismatch
                continue;
            }
        }

        return null;
    }

    public function login()
    {
        if ($this->session->get('isLoggedIn')) {
            return redirect()->to(site_url('/etudiants'));
        }

        if ($this->request->getMethod(true) !== 'POST') {
            return view('auth/login', [
                'title'          => 'Login',
                'defaultEmail'   => 'admin@example.com',
                'defaultPassword'=> 'admin123',
            ]);
        }

        $email    = trim((string) $this->request->getPost('email'));
        $password = (string) $this->request->getPost('password');

        if ($email === '' || $password === '') {
            return view('auth/login', [
                'title'           => 'Login',
                'defaultEmail'    => 'admin@example.com',
                'defaultPassword' => 'admin123',
                'errorKey'        => $email === '' ? 'email_incorrect' : 'password_incorrect',
            ]);
        }

        // Prefer model, but fall back to direct lookup for table-name compatibility.
        $userModel = new UserModel();
        $user      = $userModel->where('email', $email)->first() ?? $this->findUserByEmail($email);

        if (!$user) {
            return view('auth/login', [
                'title'           => 'Login',
                'defaultEmail'    => $email,
                'defaultPassword' => $password,
                'errorKey'        => 'email_incorrect',
            ]);
        }

        if (!password_verify($password, (string) $user['password_hash'])) {
            return view('auth/login', [
                'title'           => 'Login',
                'defaultEmail'    => $email,
                'defaultPassword' => $password,
                'errorKey'        => 'password_incorrect',
            ]);
        }

        $this->session->regenerate(true);
        $this->session->set([
            'isLoggedIn' => true,
            'user_id'    => (int) $user['id'],
            'user_email' => (string) $user['email'],
            'username'   => (string) ($user['username'] ?? ''),
        ]);

        // Ensure session is written before redirect (avoid "stays on /login" loops).
        if (method_exists($this->session, 'close')) {
            $this->session->close();
        }

        return redirect()->to(site_url('/etudiants'));
    }

    public function logout()
    {
        session()->destroy();
        return redirect()->to(site_url('/login'));
    }
}
