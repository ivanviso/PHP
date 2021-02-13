<head>
<link rel="stylesheet" href="/css/login.css">
</head>
<?php
include '../php/mysqlcon.php';
include '../php/flexnav.php';
session_start();
$usuario=$_SESSION['usuario'];
$sql="SELECT * FROM usuario where usuario='$usuario'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);
    echo "<table style='margin-top: 15%; font-size: 2em;'>
<thead>
  <tr>
    <th colspan='3' style='background-color: white; font-size: 2.5em;'>DATOS DE USUARIO</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>Nombre de usuario / Correo electrónico</td>
    <td>",$row['usuario'],"</td>
    <td></td>
  </tr>
  <tr>
    <td>Nome</td>
    <td>",$row['nome'],"</td>
    <td></td>
  </tr>
  <tr>
    <td>Contraseña</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>Dirección</td>
    <td>",$row['direccion'],"</td>
    <td></td>
  </tr>
  <tr>
    <td>DNI/NIF</td>
    <td>",$row['telefono'],"</td>
    <td></td>
  </tr>
  <tr>
    <td>Telefono</td>
    <td>",$row['nifdni'],"</td>
    <td></td>
  </tr>
</tbody>
</table>";
?>