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
echo "<table class='formulario' style='font-size: 2em;'>
<thead>
  <tr>
    <th colspan='3' style='background-color: white; font-size: 2.5em;'>DATOS DE USUARIO</th>
  </tr>
</thead>
<form action='datos_editor.php' method='POST'>
<tbody>
  <tr>
    <td>Nome</td>
    <td style='padding-left: 1em'>", $row['nome'], "</td>
    <td style='padding-right: 2em'><input class=boton style='display: block;  font-size:1em' type='submit' name='nombre' value='Cambiar'></td>
  </tr>
  <tr>
    <td>Contraseña</td>
    <td>********</td>
    <td style='padding-right: 2em'><input class=boton style='display: block;  font-size:1em' type='submit' name='pwd' value='Cambiar'></td>
  </tr>
  <tr>
    <td>Dirección</td>
    <td style='padding-left: 1em'>", $row['direccion'], "</td>
    <td style='padding-right: 2em'><input class=boton style='display: block;  font-size:1em' type='submit' name='addr' value='Cambiar'></td>
  </tr>
  <tr>
    <td>DNI/NIF</td>
    <td style='padding-left: 1em'>", $row['nifdni'], "</td>
    <td style='padding-right: 2em'><input class=boton style='display: block;  font-size:1em' type='submit' name='dni' value='Cambiar'></td>
  </tr>
  <tr>
    <td>Telefono</td>
    <td style='padding-left: 1em'>", $row['telefono'], "</td>
    <td style='padding-right: 2em'><input class=boton style='display: block;  font-size:1em' type='submit' name='tlf' value='Cambiar'></td>
  </tr>
</tbody>
</table>
</form>";
?>