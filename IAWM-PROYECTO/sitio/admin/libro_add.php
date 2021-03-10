<?php

include 'session_prot_admin.php';
include 'flexnav_admin.php';
?>

<table style="margin-top: 10%">
    <form method="post" action="libro_add.php">
        <thead>
            <td>
                ISBN
            </td>
            <td>Titulo</td>
            <td>editorial</td>
            <td>descripcion</td>
            <td>cantidade</td>
            <td>Prezo</td>
            <td>Prezo_aluguer</td>
            <td>Foto</td>
            <td>Venda</td>
            <td>Aluguer</td>
        </thead>
        <tbody>
            <tr>
                <td><input type="number" name="ISBN"></td>
                <td><input type="text" name="titulo" id=""></td>
                <td><input type="text" name="editorial" id=""></td>
                <td><input type="text" name="descripcion" id=""></td>
                <td><input type="number" name="cantidade" id=""></td>
                <td><input type="number" name="prezo" id=""></td>
                <td><input type="number" name="prezo_aluguer" id=""></td>
                <td><input type="text" name="foto"></td>
                <td><input type="checkbox" name="venda"></td>
                <td><input type="checkbox" name="aluguer"></td>
                <td><input type="submit"></td>
            </tr>

        </tbody>
    </form>
</table>
<?php
if (isset($_POST)) {
    $ISBN = $_POST['ISBN'];
    $titulo = $_POST['titulo'];
    $editorial = $_POST['editorial'];
    $cantidade = $_POST['cantidade'];
    $descripcion = $_POST['descripcion'];
    $foto = $_POST['foto'];
    $prezo_aluguer = $_POST['prezo_aluguer'];
    $prezo = $_POST['prezo'];
    if (isset($_POST['venda'])) {
        $venda = true;

    } else {
        $venda = 0;
    }

    if (isset($_POST['aluguer'])) {
        $aluguer = true;
    } else {
        $aluguer = 0;
    }

    include '../php/mysqlcon.php';
    echo "INSERT INTO libro_aluguer (ISBN,titulo,cantidade,descripcion,editorial,prezo,prezo_aluguer,foto,venda,aluguer) values ($ISBN,'$titulo',$cantidade,'$descripcion','$editorial',$prezo,$prezo_aluguer,'$foto',$venda,$aluguer";
    mysqli_query($conn, "INSERT INTO libro_aluguer (ISBN,titulo,cantidade,descripcion,editorial,prezo,prezo_aluguer,foto,venda,aluguer) values ($ISBN,'$titulo',$cantidade,'$descripcion','$editorial',$prezo,$prezo_aluguer,'$foto',$venda,$aluguer)");
}
?>