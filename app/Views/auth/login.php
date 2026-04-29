<?= $this->extend('layouts/main') ?>

<?= $this->section('content') ?>
<div class="page-header">
    <div>
        <h1 class="page-title">Login</h1>
        <div class="breadcrumbs">
            <a href="<?= site_url('/') ?>">Accueil</a> / <span>Login</span>
        </div>
    </div>
</div>

<div class="card card--narrow">
    <?php if (session()->getFlashdata('error')): ?>
        <div class="alert alert-error">
            <?= esc(session()->getFlashdata('error')) ?>
        </div>
    <?php endif; ?>

    <form method="post" action="<?= site_url('/login') ?>">
        <?= csrf_field() ?>

        <div class="field">
            <label for="email">Email</label>
            <input
                id="email"
                name="email"
                type="email"
                required
                value="<?= esc(old('email', $defaultEmail ?? '')) ?>"
                autocomplete="username"
            >
        </div>

        <div class="field">
            <label for="password">Mot de passe</label>
            <input
                id="password"
                name="password"
                type="password"
                required
                value="<?= esc(old('password', $defaultPassword ?? '')) ?>"
                autocomplete="current-password"
            >
        </div>

        <button class="btn" type="submit">Se connecter</button>
    </form>

    <p class="muted mt-3">
        Par défaut: <strong>admin@example.com</strong> / <strong>admin123</strong>
    </p>
</div>
<?= $this->endSection() ?>
