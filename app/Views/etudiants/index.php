<?= $this->extend('layouts/main') ?>

<?= $this->section('content') ?>
<div class="page-header">
    <div>
        <h1 class="page-title">Liste des étudiants</h1>
        <div class="breadcrumbs">
            <a href="<?= site_url('/') ?>">Accueil</a> / <span>Etudiants</span>
        </div>
    </div>
</div>

<?php if (!empty($error)): ?>
    <div class="alert alert-error">
        <?= esc($error) ?>
    </div>
<?php endif; ?>

<div class="card">
    <div class="table-wrap">
        <table class="table">
            <thead>
            <tr>
                <th style="width: 44px;"><input type="checkbox" aria-label="Tout sélectionner" disabled></th>
                <th>Etudiant</th>
                <th style="width: 180px;">Matricule</th>
            </tr>
            </thead>
            <tbody>
            <?php if (empty($etudiants)): ?>
                <tr>
                    <td colspan="3" class="muted">Aucun étudiant.</td>
                </tr>
            <?php else: ?>
                <?php foreach ($etudiants as $e): ?>
                    <?php $prenom = (string) ($e['prenom'] ?? ''); ?>
                    <?php $nom = (string) ($e['nom'] ?? ''); ?>
                    <tr>
                        <td><input type="checkbox" aria-label="Sélectionner" disabled></td>
                        <td>
                            <div class="usercell">
                                <span class="avatar">
                                    <?= esc(strtoupper(substr($prenom ?: $nom, 0, 1) . substr($nom, 0, 1))) ?>
                                </span>
                                <div>
                                    <div class="usercell-name"><?= esc(trim($prenom . ' ' . $nom)) ?></div>
                                    <div class="usercell-sub muted"><?= esc($e['etu']) ?></div>
                                </div>
                            </div>
                        </td>
                        <td><?= esc($e['etu']) ?></td>
                    </tr>
                <?php endforeach; ?>
            <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>
<?= $this->endSection() ?>
