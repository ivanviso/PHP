
<!DOCTYPE html>
<html lang="en">

<head>
    <?php include 'php/session_prot.php';?>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="./css/flexnav.css">
    <link rel="stylesheet" type="text/css" href="./css/demo.css">
    <link rel="stylesheet" href="css/login.css">
</head>

<body>
    <div id="nav-background">
        <div id="nav-container">
            <header id="nav-header">
                <h1><a href="#" id="nav-logo">Vivir Outras Vidas</a></h1>
                <div id="nav-menu-button">MENU</div>
            </header>
            <nav>
                <ul class="nav-ul hide-ul">
                    <li><a class="nav-link active-link" href="#">Home</a></li>
                    <li><a class="nav-link" href="#">Alquiler</a></li>
                    <li><a class="nav-link" href="#">Venta</a></li>
                    <li><a class="nav-link" href="#">Datos</a></li>
                    <li><a class="nav-link" href="#">Devolucion</a></li>
                    <li><a class="nav-link" href="#">Catalogo</a></li>

                </ul>
            </nav>
        </div>
    </div>

    <div id="main-content">
        <article class="main-article">
            <?php
include 'php/mysqlcon.php';
$sql = "SELECT * FROM libro_aluguer ORDER BY titulo";
$result = mysqli_query($conn, $sql); // First parameter is just return of "mysqli_connect()" function
//echo "<h1>$_SESSION['test']</h1>";
echo "<br>";
echo "<table class='catalogo' border='1' style='margin-top: 15%' ;>",
  "<thead>
    <td>ISBN</td>
    <td>Titulo</td>
    <td>Descripcion</td>
    <td>Prezo</td>
    <td>Prezo aluguer</td>
    <td>Portada</td>
  </thead>";
while ($row = mysqli_fetch_assoc($result)) {
    echo "<tr>";
    echo "<td>", $row['ISBN'], "</td>";
    echo "<td>", $row['titulo'], "</td>";
    //echo "<td>",$row['cantidade'],"</td>"; Interesa mostrarlo??
    echo "<td>", $row['descripcion'], "</td>";
    echo "<td>", $row['prezo'], "€", "</td>";
    echo "<td>", $row['prezo_aluguer'], "€", "</td>";
    echo "<td>", "<img src=", $row['foto'], ">", "</td>";
}
//    echo "<td> <img src='https://picsum.photos/200/300'> </td>" ;
echo "</tr>";

echo "</table>";

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