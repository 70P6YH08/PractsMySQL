<?php
require_once 'header.php';
?>
    <h2>Добро пожаловать в наш магазин!</h2>
    <p>Текущая категория: <strong><?= $active_category ?: 'все товары' ?></strong></p>
    <p>Здесь будет отображаться список товаров...</p>
<?php
require_once 'footer.php';
?>