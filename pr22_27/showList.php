

<!DOCTYPE html>
<html>
<head>
<title>БД</title>
<meta charset="utf-8" />
</head>
<body>
<h2>База данных</h2>
<?php

include_once 'connection.php';
$conn = new mysqli($host, $user, $password, $database);
if ($conn->connect_error){
    echo "Не удалось установить подключение к базе данных";
}

if($res = $conn->query('SELECT * FROM `games`')){
    foreach($res as $row){
        echo '<ul>';
        echo '<li>';
        echo "<p>" . $row["idGame"] . "</p>";
        echo "<p><h3>" . $row["name"] . "</h3></p>";
        echo "<p>" . $row["description"] . "</p>";
        echo "<p>" . $row["category"] . "</p>";
        echo "<p>" . $row["price"] . "$" . "</p>";
        echo '</li>';
        echo '</ul>';
    }
    $res->free();
}
else{
    echo "Ошибка:" . $conn->error;
}
$conn->close();
?>