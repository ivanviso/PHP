<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="./css/flexnav.css">
    <link rel="stylesheet" type="text/css" href="./css/demo.css">
    <link rel="stylesheet" href="css/login.css">
</head>

<?php include 'php/session_prot.php';?>
            <?php
include 'php/flexnav.php';
include 'php/mysqlcon.php';

echo "<table class='formulario' style='font-size: 2em; margin-left: -30%;'>
<thead>
  <tr>
    <th colspan='4' style='background-color: white; font-size: 2.5em;'>LIBROS ALQUILADOS</th>
  </tr>
</thead>
<form action='php/devolucion.php' method='POST'>
<tbody>
  <tr>
    <td>Titulo</td>
    <td colspan='2' style='padding-left: 1em'>Fecha</td>
    <td style='padding-right: 2em'></td>
  </tr>";
$usuario=$_SESSION['usuario'];
//echo "select libro_aluguer.ISBN,alugado_en,usuario,titulo,libro_aluguer.prezo_aluguer FROM libro_aluguer JOIN libro_alugado ON libro_aluguer.ISBN = libro_alugado.ISBN where usuario='$usuario'";
$result = mysqli_query($conn, "select libro_aluguer.ISBN,alugado_en,usuario,titulo,libro_aluguer.prezo_aluguer,foto FROM libro_aluguer JOIN libro_alugado ON libro_aluguer.ISBN = libro_alugado.ISBN where usuario='$usuario'");
    while ($row = mysqli_fetch_assoc($result)) {
        $titulo=$row['titulo'];
        $precio=$row['prezo_aluguer'];
        $fecha=$row['alugado_en'];
        $foto=$row['foto'];
        echo "<tr><td nowrap>$titulo</td><td nowrap><span>$fecha</span></td><td><img src=$foto></td><td style='padding-right: 2em'><input class=boton style='display: block;  font-size:1em' type='submit' name='".$row['ISBN']."' value='Devolver'></td></tr>";

    }

echo "</tbody>
</table>
</form>";
?>