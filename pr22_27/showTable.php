<!DOCTYPE html>
<html>
<head>
<title>БД</title>
<meta charset="utf-8" />
</head>
<body>
<h2>База данных</h2>
<form action="showTable.php" method="GET"></form>
    <input type="radio" name="sortBy" value="name" <?php echo (!isset($_GET['sortBy']) || $_GET['sortBy'] == 'name') ? 'checked' : ''; ?>/>
    <input type="radio" name="sortBy" value="price" <?php echo (isset($_GET['sortBy']) && $_GET['sortBy'] == 'price') ? 'checked' : ''; ?> />
    <input type="submit" name="submit" value="Сортировать">
</form>
<?php

$allowedFields = ['name', 'price'];
$sortBy = isset($_GET['sortBy']) && in_array($_GET['sortBy'], $allowedFields) ? $_GET['sortBy'] : 'name';
include_once 'connection.php';
$conn = new mysqli($host, $user, $password, $database);
if ($conn->connect_error){
    echo "Не удалось установить подключение к базе данных";
}

if($res = $conn->query('SELECT * FROM `games` ORDER BY ' . $sortBy)){
    echo
    '<table
    <tr>
    <th>idGame</th>
    <th><a href="showTable.php?sortBy=name">name</a></th>
    <th>description</th>
    <th>category</th>
    <th><a href="showTable.php?sortBy=price">price</a></th>
    </tr>';
    foreach($res as $row){
        echo "<tr>";
        echo "<td>" . $row["idGame"] . "</td>";
        echo "<td><h3>" . $row["name"] . "</h3></td>";
        echo "<td><p>" . $row["description"] . "</p></td>";
        echo "<td>" . $row["category"] . "</td>";
        echo "<td>" . $row["price"] . "$" . "</td>";
		echo "</tr>";
    }
    echo "</table>";
    $res->free();
}
else{
    echo "Ошибка:" . $conn->error;
}
$conn->close();
?>