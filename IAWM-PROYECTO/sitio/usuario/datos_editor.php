<head>
    <link rel="stylesheet" href="/css/login.css">
    <?php include '../php/session_prot.php';?>
</head>
<?php
include '../php/mysqlcon.php';
include '../php/flexnav.php';
session_start();
$usuario = $_SESSION['usuario'];
$sql = "SELECT * FROM usuario where usuario='$usuario'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);
?>
<?php

if ($_POST['usuario']) {
    $cambiar = 'Nombre de usuario';
    $sqlupd = 'usuario';
}

if ($_POST['pwd']) {
    $cambiar = 'Contraseña';
    $sqlupd = 'contrasinal';
}

if ($_POST['nombre']) {
    $cambiar = 'Nombre';
    $sqlupd = 'nome';
}

if ($_POST['addr']) {
    $cambiar = 'Dirección';
    $sqlupd = 'direccion';
}

if ($_POST['tlf']) {
    $cambiar = 'telefono';
    $sqlupd = $cambiar;
}

if ($_POST['dni']) {
    $cambiar = 'DNI';
    $sqlupd = 'nifdni';
}
$_SESSION['sqlu'] = $sqlupd;
session_start();
$usuario = $_SESSION['usuario'];
$sql = "SELECT * FROM usuario where usuario='$usuario'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);
$cambiarval = $row[$sqlupd];
echo "<table class='formulario' style='font-size: 2em;'>
<thead>
  <tr>
    <th colspan='3' style='background-color: white; font-size: 2.5em;'>CAMBIAR DATOS</th>
  </tr>
</thead>
<form action='datos_update.php' method='POST'>
<tbody>
  <tr>
    <td>Valor Antiguo</td>
    <td>$cambiar</td>
    <td style='padding-left: 1em'>", $cambiarval, "</td>
  </tr>
  <tr>
  <td>Nuevo valor</td>
  <td><input type='text' name='v1'></td>
  <td><input type='text' name='v2'></td>
</tr>
<tr>
<td colspan='3' style='padding-right: 2em;'><input class=boton style='display: block ;margin: 0%;  font-size:1em' type='submit' name='nov_data' value='Cambiar' method='post'></td>
</tr>
</tbody>
</table>
</form>";

?>