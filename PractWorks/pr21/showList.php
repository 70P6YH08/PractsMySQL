<?php
include_once 'conection.php';
@$db = new PDO("mysql:dbname={$database};host={$host};charset=utf8", $user,$password);
if($db->connect_erno){
    $db->select_db($database);
    if($res = $db->query('SELECT * FROM `books`')){
        echo $res->num_rows . '<br>';
        $res->close()
    }
}
else{
    echo "Не удалось установить подключение к базе данных"
}
?>
<table>
<thead>
<tr>
<? for ($i = 0 ; $i < $res->columnCount() ; $i++) : ?>
<td><?= $res->getColumnMeta($i)['name'] ?></td>
<? endfor ?>
</tr>
</thead>
<tbody>
<? while ($row = $res->fetch(PDO::FETCH_NUM)) : ?>
<tr>
<? foreach ($row as $cell) : ?>
<td><?= $cell ?></td>
<? endforeach ?>
</tr>
<? endwhile ?>
</tbody>
</table>