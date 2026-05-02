</main>
<footer>
    <hr>
    <p>&copy; <?= date('Y') ?> Мой магазин. Все права защищены.</p>
    <form method="POST" action="">
        <label>Подписка на рассылку:</label>
        <input type="email" name="email" placeholder="Ваш e-mail">
        <button type="submit">Подписаться</button>
    </form>
    <?php
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['email'])) {
        $email = htmlspecialchars($_POST['email']);
        echo "<p style='color: green;'>Спасибо, {$email}! Вы подписаны на рассылку.</p>";
    }
    ?>
</footer>
</body>
</html>