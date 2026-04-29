<h1>Liste des produits</h1>
<ul>
<ul>
    <?php foreach ($produits as $unProduit): ?>
        <li>
            <?= $unProduit['name'] ?> - <?= $unProduit['prix'] ?> €
        </li>
    <?php endforeach; ?>
</ul>
</ul>