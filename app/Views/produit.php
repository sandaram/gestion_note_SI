<?= $this->extend('layouts/main') ?>

<?= $this->section('content') ?>
<h1>Liste des produits</h1>

<div class="card">
    <?php if (empty($produits)): ?>
        <div class="muted">Aucun produit.</div>
    <?php else: ?>
        <ul class="list">
            <?php foreach ($produits as $unProduit): ?>
                <li>
                    <strong><?= esc($unProduit['name']) ?></strong>
                    <span class="muted">— <?= esc($unProduit['prix']) ?> €</span>
                </li>
            <?php endforeach; ?>
        </ul>
    <?php endif; ?>
</div>
<?= $this->endSection() ?>
