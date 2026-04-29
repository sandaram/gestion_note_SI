<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title><?= esc($title ?? 'Application') ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="/favicon.ico">
    <link rel="stylesheet" href="/assets/css/app.css">
</head>
<body>
<div class="app">
    <aside class="sidebar" aria-label="Sidebar">
        <a class="logo" href="<?= site_url('/') ?>">
            <span class="logo-badge">SI</span>
            <span>
                SysInfo<br>
                <span style="font-size: 0.8rem; font-weight: 500; opacity: 0.7;">v2.4.0</span>
            </span>
        </a>

        <div class="section-title">Navigation</div>
        <nav class="sidebar-nav">
            <a href="<?= site_url('/') ?>">Accueil</a>
            <a href="<?= site_url('/etudiants') ?>" class="<?= url_is('etudiants*') ? 'is-active' : '' ?>">Etudiants</a>
            <a href="<?= site_url('/login') ?>" class="<?= url_is('login') ? 'is-active' : '' ?>">Login</a>
            <?php if (session()->get('isLoggedIn')): ?>
                <a href="<?= site_url('/logout') ?>">Logout</a>
            <?php endif; ?>
        </nav>
    </aside>

    <div class="content">
        <div class="topbar">
            <div class="search">
                <input type="search" placeholder="Rechercher..." aria-label="Rechercher">
            </div>
        </div>

        <main class="page">
            <?= $this->renderSection('content') ?>
            <footer>
                <div class="footer-inner">
                    <?= esc($footer ?? '© ' . date('Y')) ?>
                </div>
            </footer>
        </main>
    </div>
</div>
</body>
</html>
