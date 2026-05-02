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
$limit = "";
if ($conn->connect_error){
    echo "Не удалось установить подключение к базе данных";
}

$current_page = isset($_GET['page']) ? $_GET['page'] : 1;
$N = 3;
$start_page = ($current_page - 1) * $N;
$n_games = $conn->query('SELECT COUNT(*) FROM `games`');
$fetch_row_games = $n_games->fetch_row();
$num_rows = $fetch_row_games[0];

if(isset($_GET['condBy'])){
    $condBy = $_GET['condBy'];
}
else{
    $condBy = '';
    $limit = "LIMIT $start_page, $N";
}


echo '<ul>';
echo "<li><a href='showList.php?condBy=Шутер'>Шутеры</a></li>";
echo "<li><a href='showList.php?condBy=RPG'>RPG</a></li>";
echo "<li><a href='showList.php?condBy=Симулятор'>Симуляторы</a></li>";
echo '</ul>';

if($res = $conn->query("SELECT * FROM `games` WHERE category LIKE '%$condBy%' $limit")){
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

echo '<center><h2>';
for ($i = 1; $i <= $num_rows/$N + 1; $i++) {
    echo "<a href='showList.php?page={$i}'>" . " ". $i . "</a>" . " ";
}
echo '</h2></center>';

$conn->close();
?>