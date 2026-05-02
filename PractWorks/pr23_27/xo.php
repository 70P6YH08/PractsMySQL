<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>$WAG</title>
</head>

<body>
    <div>
        <?php
        echo "<h1>Привет, меня зовут Хикмет</h1>";
        $sentnce = "Произвольное простое предложение.";
        echo "<p>Исходная строка: " . strlen($sentnce) . "</p>";
        echo "<p>Строка в верхнем регистре: " . strtoupper($sentnce) . "</p>";
        echo "<p>Строка в нижнем регистре: " . strtolower($sentnce) . "</p>";
        $newSentence = str_replace("простое", "сложное", $sentnce);
        echo "<p>Замена слова: '$newSentence'</p>";

        $string1 = "Я хочу";
        $string2 = "домой";
        $resultString = $string1 . " " . $string2;
        echo "<p>Объедененная строка: '$resultString'</p>";

        $integerNumber = 20;
        $floatNumber = 5.15;
        $stringVariable = "Привет!";
        $booleanValue = true;
        echo "Целое число: $integerNumber<br>";
        echo "Число c плавающей точкой: $floatNumber<br>";
        echo "Строка: $stringVariable<br>";
        echo "Булевое значение: $booleanValue<br>";

        echo "Тип целочисленной переменной: " . gettype($integerNumber) . "<br>";
        echo "Тип переменной c плавающей точкой: " . gettype($floatNumber) . "<br>";
        echo "Тип строки: " . gettype($stringVariable) . "<br>";
        echo "Тип булевой переменной: " . gettype($booleanValue) . "<br>";

        $integerNumber += 5;
        echo "Измененное значение целого числа: $integerNumber<br>";

        $age = 19;
        if ($age < 18) {
            echo "Ваш возраст: $age. Вы несовершеннолетний.<br>";
        } elseif ($age >= 18 && $age <= 60) {
            echo "Ваш возраст: $age. Вы взрослый человек.<br>";
        } else {
            echo "Ваш возраст: $age. Вы пенсионер.<br>";
        }

        if ($age % 2 == 0) {
            echo "Ваш возраст четный.<br>";
        } else {
            echo "Ваш возраст нечетный.<br>";
        }

        for ($i = 1; $i <= 20; $i++) {
            echo "$i<br>";
        }

        $sum = 0;
        $i = 1;
        while ($i <= 100) {
            $sum += $i;
            $i++;
        } echo "Сумма чисел от 1 до 100 равна: $sum<br>";

        $cars = ["Nissan Skyline R32", "Toyota AE86 Levin", "Lada Riva"];
        foreach ($cars as $car) {
            echo "$car <br>";
        }

        for ($i = 1; $i <= 10; $i++) {
            for ($j = 1; $j <= 10; $j++) {
                echo "$i x $j = " . ($i * $j) . "<br>";
            }
        }

        $fruits = ["Клубника", "Киви", "Банан"];
        array_push($fruits, 'Дыня');
        foreach ($fruits as $fruit) {
            echo "$fruit <br>";
        }
        ?>
