<!DOCTYPE html>
<html>
<head>
<title>БД</title>
<meta charset="utf-8" />
</head>
<body>
<h2>База данных</h2>
<form action="showTable.php" method="GET">
    <input type="radio" name="sortBy" value="name" <?= $sortBy == 'name' ? 'checked' : '' ?>/>
    <input type="radio" name="sortBy" value="price" <?= $sortBy == 'price' ? 'checked' : '' ?>/>
    <input type="submit" value="Сортировать">
</form>
<form action="showTable.php" method="GET">
    <label for="Цена:">Введите цену:</label>
    <input type="text" name="price" value = "">

    <label for="Название:">Введите название:</label>
    <input type="text" name="name" value = "">

    <label for="Описание:">Введите описание:</label>
    <input type="text" name="description" value = "">

    <input type="submit" name="filter" value="yes">
    <input type='submit' name='filter' value='no'>
</form>
<?php


$sortBy = isset($_GET['sortBy']) ? $_GET['sortBy'] : 'idGame';

include_once 'connection.php';
$conn = new mysqli($host, $user, $password, $database);
if ($conn->connect_error){
    echo "Не удалось установить подключение к базе данных";
}

$conditions = [];
$where = '';
if(isset($_GET['filter']) && $_GET['filter'] == 'yes'){
    if(!empty($_GET['price'])){
        $conditions[] = "price > " . (float)$_GET['price'];
    }
    if(!empty($_GET['name'])){
        $name = $conn->real_escape_string($_GET['name']);
        $conditions[] = "name LIKE '%$name%'";
    }
    if(!empty($_GET['description'])){
        $description = $conn->real_escape_string($_GET['description']);
        $conditions[] = "description LIKE '%$description%'";
    }
}

if (count($conditions)) $where = "WHERE " . implode(" AND ", $conditions);


$select_id = 0;

if (isset($_GET['del']))
{
    $select_id = $_GET['del'];
}

if($res = $conn->query("SELECT * FROM `games` $where ORDER BY $sortBy")){
    echo
    '<table
    <tr>
    <th>idGame</th>
    <th><a href="showTable.php?sortBy=name">name</a></th>
    <th>description</th>
    <th>category</th>
    <th><a href="showTable.php?sortBy=price">price</a></th>
    <th>Удаление</th>
    </tr>';
    foreach($res as $row){
        echo "<tr>";
        echo "<td>" . $row["idGame"] . "</td>";
        echo "<td><h3>" . $row["name"] . "</h3></td>";
        echo "<td><p>" . $row["description"] . "</p></td>";
        echo "<td>" . $row["category"] . "</td>";
        echo "<td>" . $row["price"] . "$" . "</td>";
        echo "<td>
            <form action='editTable.php?select_id=$select_id' method='GET'>
                <button name='del' type='submit' value='{$row['idGame']}'>
                    Удалить
                </button>
            </form>
        </td>";
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
