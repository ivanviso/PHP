<?php

include 'session_prot_admin.php';
include 'flexnav_admin.php';
?>


<table style="margin-top: 10%">
        <thead>
            <td>
            ID aluguer
            </td>
            <td>
            ID
            </td>
            <td>
                ISBN
            </td>
            <td>Usuario</td>
            <td>Devolto_en</td>

        </thead>
        <tbody>
            <tr> 
<?php
include '../php/mysqlcon.php';
$result=mysqli_query($conn,"select id_aluguer,id_devolucion,ISBN,usuario,devolto_en from libro_devolto where confirmado=0");
while ($row = mysqli_fetch_assoc($result)) {
    echo '<form method="post" action="libro_conf_dev.php">';

    foreach ($row as $key => $value) {
        echo '<td>',$value;
        if ($key=="id_devolucion"){ 
            echo "<input type='hidden' name='ID' value='$value'>";
        }
        echo '</td>';
    }
    echo '<td><input value="Confirmar Devolución" type="submit"></td>';
    echo "</tr></form>";
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $ID=$_POST['ID'];
    mysqli_query($conn,"update libro_devolto set confirmado=1 where id_devolucion=$ID");
    unset($ID);
    unset($_POST);
}
?>
