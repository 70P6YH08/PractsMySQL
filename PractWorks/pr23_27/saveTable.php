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

<h2>Запись <?= $select_id ?> успешно удалена</h2>
<form action="showTable.php" method="GET">
    <button>Вернуться назад</button>
</form>

<?php
include_once 'connection.php';

$conn = new mysqli($host, $user, $password, $database);
if ($conn->connect_error){
    echo "Не удалось установить подключение к базе данных";
}

$select_id = isset($_GET['del']) ? (int)$_GET['del'] : 0;
$agree = $_GET['agree'] ?? '';
$message = "";

if ($select_id && $agree === 'yes') {
    if ($res = $conn->query("DELETE FROM games WHERE idGame = $select_id")) {
        echo "Запись $select_id успешно удалена!";
    }
    else{
        echo "Ошибка:" . $conn->error;
    }
}
else {
    echo "Не переданы обязательные параметры (id или подтверждение).";
}
$conn->close();
?>