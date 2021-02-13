<?php
include '../php/mysqlcon.php';
session_start();
$usuario=$_SESSION['usuario'];
$sql="SELECT * FROM usuario where usuario='$usuario'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);
    echo $row['usuario'],$row['nome'],$row['direccion'],$row['telefono'],$row['nifdni'];
?>