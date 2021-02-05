  
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>FlexNav</title>
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
      <article class="main-article"><?php
include 'php/mysqlcon.php';
$sql = "SELECT * FROM libro_aluguer ORDER BY titulo";
$result = mysqli_query($conn, $sql); // First parameter is just return of "mysqli_connect()" function
echo "<br>";
echo "<table border='1' style='margin-top: 15%';>";
while ($row = mysqli_fetch_assoc($result)) { // Important line !!! Check summary get row on array ..
    echo "<tr>";
    foreach ($row as $field => $value) { // I you want you can right this line like this: foreach($row as $value) {
        echo "<td>" . $value . "</td>"; // I just did not use "htmlspecialchars()" function. 

    }
    echo "<td> <img src='https://picsum.photos/200/300'> </td>" ;
    echo "</tr>";
}
echo "</table>";
?>
      </article>
    </div>

    <script src="./js/script.js"></script>
  </body>
</html>