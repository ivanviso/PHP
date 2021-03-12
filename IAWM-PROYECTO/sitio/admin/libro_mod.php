<?php
header("Expires: on, 01 Jan 1970 00:00:00 GMT");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
include 'session_prot_admin.php';
include 'flexnav_admin.php';
sleep(2);

?>

<table style="margin-top: 10%">
        <thead>
            <td>
                ISBN
            </td>
            <td>Titulo</td>
            <td>Editorial</td>
            <td>Descripcion</td>
            <td>Cantidade</td>
            <td>Prezo</td>
            <td>Prezo_aluguer</td>
            <td>Foto</td>
            <td>Venda</td>
            <td>Aluguer</td>
        </thead>
        <tbody>
            <tr>
                <?php

include '../php/mysqlcon.php';
$result=mysqli_query($conn,"select * from libro_aluguer");

while ($row = mysqli_fetch_assoc($result)) {
    $ISBNa = $row['ISBN'];
    $tituloa = $row['titulo'];
    $editoriala = $row['editorial'];
    $cantidadea = $row['cantidade'];
    $descripciona = $row['descripcion'];
    $fotoa = $row['foto'];
    $prezo_aluguera = $row['prezo_aluguer'];
    $prezoa = $row['prezo'];
    $vendaa=$row['venda'];
    $aluguera=$row['aluguer'];
    if($vendaa==1) {
        $checkervenda="checked";
    } else {$checkervenda=null;
    }

    if($aluguera==1) {
        $checkeraluguer="checked";
    } else {$checkeraluguer=null;
    }
        echo '
<form method="post" action="libro_mod.php">

                <td>'.$ISBNa.'<input value="'.$ISBNa.'" type="hidden" name="bookarray[ISBN]" id=""></td>',' 
                <td><input value="'.$tituloa.'" type="text" name="bookarray[titulo]" id=""></td>
                <td><input value="'.$editoriala.'"type="text" name="bookarray[editorial]" id=""></td>
                <td><input value="'.$descripciona.'"type="text" name="bookarray[descripcion]" id=""></td>
                <td><input value="'.$cantidadea.'"type="number" name="bookarray[cantidade]" id=""></td>
                <td><input value="'.$prezoa.'"type="number" name="bookarray[prezo]" id=""></td>
                <td><input value="'.$prezo_aluguera.'"type="number" name="bookarray[prezo_aluguer]" id=""></td>
                <td><input value="'.$fotoa.'"type="text" name="bookarray[foto]"></td>
                <td><input value="'.$vendaa.'"type="checkbox" name="bookarray[venda]" '.$checkervenda.'></td>
                <td><input value="'.$aluguera.'"type="checkbox" name="bookarray[aluguer]" '.$checkeraluguer.'></td>
                <td><input name="sub'.$ISBNa.'" value="modificar" type="submit"></td>
                </form>
            </tr> ';
        }

            ?>
        </tbody>
</table>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $ISBN = $_POST['bookarray']['ISBN'];
    $titulo = $_POST['bookarray']['titulo'];
    $editorial = $_POST['bookarray']['editorial'];
    $cantidade = $_POST['bookarray']['cantidade'];
    $descripcion = $_POST['bookarray']['descripcion'];
    $foto = $_POST['bookarray']['foto'];
    $prezo_aluguer = $_POST['bookarray']['prezo_aluguer'];
    $prezo = $_POST['bookarray']['prezo'];
    if (isset($_POST['bookarray']['venda'])) {
        $venda = 1;

    } else {
        $venda = 0;
    }

    if (isset($_POST['bookarray']['aluguer'])) {
        $aluguer = 1;
    } else {
        $aluguer = 0;
    }

    mysqli_query($conn, "REPLACE INTO libro_aluguer (ISBN,titulo,cantidade,descripcion,editorial,prezo,prezo_aluguer,foto,venda,aluguer) values ($ISBN,'$titulo',$cantidade,'$descripcion','$editorial',$prezo,$prezo_aluguer,'$foto',$venda,$aluguer)");
    js_redirect('/admin/cargando.php');
}

?>