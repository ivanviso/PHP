<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="./css/flexnav.css">
    <link rel="stylesheet" type="text/css" href="./css/demo.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<?PHP

session_start();
include 'php/session_prot.php';

if (isset($_POST['ISBNa'])) {
    $ISBN_ALQUILER = $_POST['ISBNa'];
    foreach ($ISBN_ALQUILER as $key) {
        $_SESSION['carrito_alquiler'][] = $key;
    }
}
if (isset($_POST['ISBNc'])) {
    $ISBN_COMPRA = $_POST['ISBNc'];
    foreach ($ISBN_COMPRA as $key) {
        $_SESSION['carrito_compra'][] = $key;
    }
}

include 'php/mysqlcon.php';
include 'php/flexnav.php';

// First parameter is just return of "mysqli_connect()" function
echo
"<table class='catalogo' border='1' style='margin-top: 15%;'>",
    '<thead>
    <td>Titulo</td>
    <td>Descripcion</td>
    <td>Prezo</td>
    <td>Portada</td>
    <form action="php/comprar.php" method="get">
    <td style="padding-right: 1em" ><button class="boton"; type="submit" value="Borrar">Comprar</td>
    </form>
    <form action="php/sessionreset.php" method="get">
    <td style="padding-right: 1em"><button class="boton" type="submit" value="Borrar">Borrar</td>
    </form>
    </thead>';
if (isset($_SESSION['carrito_alquiler'])) {
    foreach ($_SESSION['carrito_alquiler'] as $ISBN) {
        $result = mysqli_query($conn, "SELECT * FROM libro_aluguer where ISBN=$ISBN");
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>", $row['titulo'], "</td>";
            //echo "<td>",$row['cantidade'],"</td>"; Interesa mostrarlo??
            echo "<td>", $row['descripcion'], "</td>";
            echo "<td>", $row['prezo_aluguer'], "€ Alquiler", "</td>";
            echo "<td>", "<img src=", $row['foto'], ">", "</td>";
        }
    }
}
if (isset($_SESSION['carrito_compra'])) {
    foreach ($_SESSION['carrito_compra'] as $ISBN) {
        $result = mysqli_query($conn, "SELECT * FROM libro_aluguer where ISBN=$ISBN");
        echo "<br>";
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>", $row['titulo'], "</td>";
            //echo "<td>",$row['cantidade'],"</td>"; Interesa mostrarlo??
            echo "<td>", $row['descripcion'], "</td>";
            echo "<td>", $row['prezo'], "€", "</td>";
            echo "<td>", "<img src=", $row['foto'], ">", "</td>";
        }
    }
}

//var_dump($_SESSION['carrito_compra'],$_SESSION['carrito_alquiler']);
?>