<?php
//$dbc = mysqli_connect('localhost', 'root', '', 'test');
include 'connect.php';
if (!isset($_COOKIE['user_id'])) {
    if (isset($_POST['submit'])) {
        $user_username = mysqli_real_escape_string($connection, trim($_POST['username']));
        $user_password = mysqli_real_escape_string($connection, trim($_POST['password']));
        if (!empty($user_username) && !empty($user_password)) {
            $query = "SELECT id, username FROM users WHERE username = '$user_username' AND password = SHA('$user_password')";
            $data = mysqli_query($connection, $query);
            if (mysqli_num_rows($data) == 1) {
                $row = mysqli_fetch_assoc($data);
                setcookie('id', $row['user_id'], time() + (60 * 60 * 24 * 30));
                setcookie('username', $row['username'], time() + (60 * 60 * 24 * 30));
                # $home_url = 'http://' . $_SERVER['PHP_HOST'];
                header('Location: ' . './cinema.php');
            } else {
                echo 'Извините, вы должны ввести правильные имя пользователя и пароль';
            }
        } else {
            echo 'Извините вы должны заполнить поля правильно';
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>Document</title>
</head>
<html>
<body>
<div class="contanier">
    <form class="form-signin" method="POST">
        <h2>Login</h2>
        <input type="text" name="username" class="form-control" placeholder="Username" required>
        <input type="password" name="password" class="form-control" placeholder="Password" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit" name="submit">Вход</button>
        <a href="signup.php" type="submit" class="form-control btn btn-lg btn-primary btn-block">Регистрация</a>
    </form>
</div>
<footer class="clear">
    <p>Все права защищены</p>
</footer>
</body>
</html>