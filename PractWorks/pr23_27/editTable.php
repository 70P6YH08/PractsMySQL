<!DOCTYPE html>
<html>
<head>
<title>БД</title>
<meta charset="utf-8" />
</head>
<body>
<?php
    $select_id = isset($_GET['del']) ? (int)$_GET['del'] : 0;
    $select_id_upd = isset($_GET['upd']) ? (int)$_GET['upd'] : 0;
?>
<?php if ($select_id > 0): ?>
    <h2>Удалить запись <?= $select_id?>?</h2>
    <form action="saveTable.php" method="GET">
        <input type="hidden" name="del" value="<?=$_GET['del'] ?>">
        <button name="agree" value="yes">Да</button>
    </form>
    <form action="showTable.php">
        <button>Нет</button>
    </form>
<?php endif; ?>

<?php if (isset($_GET['ins']) && $_GET['ins'] == 'yes') : ?>
    <h2>Добавление записи</h2>
    <form action='saveTable.php' method="GET">
        <table>
        <tr>
        <th>name</th>
        <th>description</th>
        <th>category</th>
        <th>price</th>
        </tr>
        <tr>
        <td><input type="text" name="name"></td>
        <td><input type="text" name="description"></td>
        <td><input type="text" name="category"></td>
        <td><input type="text" name="price"></td>
        </tr>
        </table>
        <button name='ins' type='submit' value="yes">
            Сохранить
        </button>
    </form>

    <form action='showTable.php'>
        <button type='submit'>
            Отмена
        </button>
    </form>
<?php endif; ?>

<?php
include_once 'connection.php';
$conn = new mysqli($host, $user, $password, $database);
if ($conn->connect_error){
    echo "Не удалось установить подключение к базе данных";
}

if ($select_id_upd > 0):
    $res = $conn->query("SELECT name, description, category, price FROM games WHERE idGame = $select_id_upd");
    if ($res && $row = $res->fetch_assoc()):
        $name = $row['name'];
        $description = $row['description'];
        $category = $row['category'];
        $price = $row['price'];
?>
    <h2>Изменить запись <?= $select_id_upd?>?</h2>
    <form action='saveTable.php' method="GET">
        <input type="hidden" name="upd_id" value="<?=$select_id_upd?>">
        <table
        <tr>
        <th>name</th>
        <th>description</th>
        <th>category</th>
        <th>price</th>
        </tr>
        <tr>
        <td><input type="text" name="name" value="<?=$name?>"></td>
        <td><input type="text" name="description" value="<?=$description?>"></td>
        <td><input type="text" name="category" value="<?=$category?>"></td>
        <td><input type="text" name="price" value="<?=$price?>"></td>
        </tr>
        </table>
        <button name='upd' type='submit' value="yes">
            Сохранить
        </button>
    </form>

    <form action='showTable.php'>
        <button type='submit'>
            Отмена
        </button>
    </form>
<?php
    $res->free();
    endif;
endif;
?>