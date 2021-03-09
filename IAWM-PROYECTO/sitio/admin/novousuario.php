<?php
include '../php/mysqlcon.php';
include 'session_prot_admin.php';
include 'flexnav_admin.php';
$result = mysqli_query($conn, "SELECT * FROM novo_rexistro");
    echo "<br>";
        echo "<table style='border: 1px solid black; margin: 5%;'>";
        echo "<thead><tr><form>";
        echo "<td style='border: 1px solid black;'>usuario</td>";
        echo "<td style='border: 1px solid black;'>contrasinal</td>";
        echo "<td style='border: 1px solid black;'>nome</td>";
        echo "<td style='border: 1px solid black;'>direccion</td>";
        echo "<td style='border: 1px solid black;'>telefono</td>";
        echo "<td style='border: 1px solid black;'>DNI</td>";
        echo "<td><input type='submit' value='aprobar' action='aprobar.php'/>", "</td>";
        echo "</tr></thead>";
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr >";
            echo "<td style='border: 1px solid black;'>", $row['usuario'], "</td>";
            echo "<td style='border: 1px solid black;'>",$row['contrasinal'],"</td>";
            echo "<td style='border: 1px solid black;'>", $row['nome'], "</td>";
            echo "<td style='border: 1px solid black;'>", $row['direccion'],"</td>";
            echo "<td style='border: 1px solid black;'>", $row['telefono'],"</td>";
            echo "<td style='border: 1px solid black;'>", $row['nifdni'],"</td>";
            echo "<td><input type='checkbox' value=",$row['usuario']," />", "</td>";
            echo "</tr>";
        }
echo "</form></table>";


?>