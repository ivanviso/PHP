<?php

//este fichero autentica y identifica a los administradores.
session_start();
$userselect="SELECT contrasinal,admin from usuario where usuario='$username'";
include 'mysqlcon.php';
$resultado=mysqli_query($conn,$userselect);
$user=mysqli_fetch_array($resultado);
$login=password_verify($contrasinal,$user['contrasinal']);
$admin=$user['admin'];
?>