<!DOCTYPE html>
<html>
<head>
<title>БД</title>
<meta charset="utf-8" />
</head>
<body>
<?php
$select_id = isset($_GET['del']) ? (int)$_GET['del'] : 0;
?>
<h2>Удалить запись <?= $select_id?>?</h2>
<form action="saveTable.php" method="GET">
    <input type="hidden" name="del" value="<?=$_GET['del'] ?>">
    <button name="agree" value="yes">Да</button>
</form>
<form action="showTable.php">
    <button>Нет</button>
</form>