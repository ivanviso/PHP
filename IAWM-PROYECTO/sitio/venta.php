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
$sql = "SELECT * FROM libro_aluguer WHERE cantidade > 0 AND venda=True ORDER BY RAND() ";
$result = mysqli_query($conn, $sql); // First parameter is just return of "mysqli_connect()" function
session_start();
echo "<br>";
echo 
    "<form name='carrito_alquiler' method='post' action='carrito.php'>",
    "<table class='catalogo' border='1' style='margin-top: 15%;'>",
    '<thead>
    <td>Titulo</td>
    <td>Descripcion</td>
    <td>Prezo</td>
    <td>Portada</td>
    <td>Comprar</td>
    <td><input type="submit" method="post" name="carrito_alquiler"></td>
    </thead>';
while ($row = mysqli_fetch_assoc($result)) {
    echo "<tr>";
    echo "<td>", $row['titulo'], "</td>";
    //echo "<td>",$row['cantidade'],"</td>"; Interesa mostrarlo??
    echo "<td>", $row['descripcion'], "</td>";
    echo "<td>", $row['prezo'], "€", "</td>";
    echo "<td>", "<img src=", $row['foto'], ">", "</td>";
    echo "<td>";
    echo "<input type='checkbox' name='ISBNc[]' value=",$row['ISBN']," />", "</td>"; // ISBNa marca que la compra es un alquiler. Todos los checkboxes marcados se convierten en un array. 

}
echo "</tr>";

echo "</table>";
echo "</form>"

/*
+---------------+---------------+------+-----+---------+-------+
| Field         | Type          | Null | Key | Default | Extra |
+---------------+---------------+------+-----+---------+-------+
| ISBN          | varchar(18)   | NO   | PRI | NULL    |       |
| titulo        | varchar(60)   | YES  |     | NULL    |       |
| cantidade     | int(11)       | YES  |     | NULL    |       |
| descripcion   | varchar(100)  | YES  |     | NULL    |       |
| editorial     | varchar(24)   | YES  |     | NULL    |       |
| prezo         | int(11)       | YES  |     | NULL    |       |
| prezo_aluguer | int(11)       | YES  |     | NULL    |       |
| foto          | varchar(1000) | YES  |     | NULL    |       |
+---------------+---------------+------+-----+---------+-------+
 */

?>
        </article>
    </div>

    <script src="./js/script.js"></script>
</body>

</html>