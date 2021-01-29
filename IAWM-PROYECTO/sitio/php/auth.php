<?php
$userselect="SELECT contrasinal from usuario where usuario='$username'";
include 'mysqlcon.php';
$resultado=mysqli_query($conn,$userselect);
$hash=mysqli_fetch_array($resultado);
$login=password_verify($contrasinal,$hash['contrasinal']);
global $login;
?>