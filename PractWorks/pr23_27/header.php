<?php
require_once 'connection.php';

$db = mysqli_connect($host, $user, $password, $database);
if (!$db) {
    die("Ошибка подключения: " . mysqli_connect_error());
}

$active_category = isset($_GET['category']) ? $_GET['category'] : '';

$categories = [];
$result = mysqli_query($db, "SELECT distinct category FROM games");
if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        $categories[] = $row['category'];
    }
}

?>
<!DOCTYPE html>
<html>
<head>
    <title>Магазин</title>
</head>
<body>
<header>
    <h1>Мой магазин</h1>
    <nav>
        <?php foreach ($categories as $cat): ?>
            <?php if ($cat == $active_category): ?>
                <span class="active"><?= $cat ?></span>
            <?php else: ?>
                <a href="?category=<?= $cat ?>"><?= $cat ?></a>
            <?php endif; ?>
        <?php endforeach; ?>
    </nav>
</header>
<main>