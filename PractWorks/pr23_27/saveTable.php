<!DOCTYPE html>
<html>
<head>
<title>БД</title>
<meta charset="utf-8" />
</head>
<body>
<?php
    $select_id = isset($_GET['del']) ? (int)$_GET['del'] : 0;
    $upd_id = isset($_GET['upd_id']) ? (int)$_GET['upd_id'] : 0;
?>

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

if($select_id > 0){
    $agree = $_GET['agree'] ?? '';
    $message = "";

    if ($select_id && $agree == 'yes') {
        if ($res = $conn->query("DELETE FROM games WHERE idGame = $select_id")) {
            echo "Запись $select_id успешно удалена!";
        }
        else{
            echo "Ошибка:" . $conn->error;
        }
    }
    else {
        echo "Не переданы обязательные параметр подтверждения";
    }
}


$name = isset($_GET['name']) ? (string)$_GET['name'] : "";
$description = isset($_GET['description']) ? (string)$_GET['description'] : "";
$category = isset($_GET['category']) ? (string)$_GET['category'] : "";
$price = isset($_GET['price']) ? (float)$_GET['price'] : 0.0;

if(isset($_GET['ins']) && $_GET['ins'] == "yes"){
    if(mb_strlen($name) > 0 && mb_strlen($category) > 0 && $price >= 0.0){
        if($res=$conn->query("INSERT INTO games (name, description, category, price) VALUES('$name', '$description', '$category', $price)")){
            echo "Добавление игры $name успешно";
        }
        else{
        echo "Не передан обязательный параметр подтверждения";
            
        }
    }
    else{
        echo "Ошибка:" . $conn->error;
    }
}

$upd_id = isset($_GET['upd_id']) ? (int)$_GET['upd_id'] : 0;

if($upd_id > 0){
    if($_GET['upd'] == "yes"){
        if($res=$conn->query("UPDATE games SET name = '$name', description = '$description', category = '$category', price = $price WHERE idGame = $upd_id")){
            echo "Изменение игры $name успешно";
        }
        else{
            echo "Ошибка:" . $conn->error;
        }
    }
    else{
        echo "Не передан обязательный параметр подтверждения";
    }
}

$conn->close();
?>