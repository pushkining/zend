<?php
include 'connect.php';
if (isset($_POST['submit'])) {
    $username = mysqli_real_escape_string($connection, trim($_POST['username']));
    $password1 = mysqli_real_escape_string($connection, trim($_POST['password1']));
    $password2 = mysqli_real_escape_string($connection, trim($_POST['password2']));
    if (!empty($username) && !empty($password1) && !empty($password2) && ($password1 == $password2)) {
        $query = "SELECT * FROM users WHERE username = '$username'";
        $data = mysqli_query($connection, $query);
        if (mysqli_num_rows($data) == 0) {
            $query = "INSERT INTO users (username, password) VALUES ('$username', SHA('$password2'))";
            mysqli_query($connection, $query);
            header('Location: ' . './index.php');
            echo 'Всё готово, можно авторизоваться';
            mysqli_close($connection);
            exit();
        } else {
            echo 'Логин уже существует';
        }

    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="contanier">
    <form class="form-signin" method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
        <h2>Registration</h2>
        <input type="text" name="username" class="form-control" placeholder="Username">
        <input type="password" name="password1" class="form-control" placeholder="Password">
        <input type="password" name="password2" class="form-control" placeholder="Password">
        <button class="btn btn-lg btn-primary btn-block" type="submit" name="submit">Регистрация</button>
    </form>
</div>
<footer class="clear">
    <p>Все права защищены</p>
</footer>

</body>

</html>
