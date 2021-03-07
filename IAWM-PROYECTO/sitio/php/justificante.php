<?php
include 'mysqlcon.php';
    session_start();
    $usuario=$_SESSION['usuario'];
    $fichero='justificante-'.$usuario.'.txt';
    header('Content-Type: application/octet-stream');
    header('Content-Disposition: attachment; filename='.basename($fichero));
    header('Expires: 0');
    header('Cache-Control: must-revalidate');
    header('Pragma: public');
    header('Content-Length: ' . strlen($fichero));
    $justificante="JUSTIFICANTE\t\t\t\t\t$usuario\n----------------------------------------------------------------------------------------------------\n";
    $justificante.="libro\t\t\t\t\t\tprecio\t\t\talugado en\n";
    $result = mysqli_query($conn, "select libro_aluguer.ISBN,alugado_en,usuario,titulo,libro_aluguer.prezo_aluguer FROM libro_aluguer JOIN libro_alugado ON libro_aluguer.ISBN = libro_alugado.ISBN where usuario='$usuario'");
    while ($row = mysqli_fetch_assoc($result)) {
        $titulo=$row['titulo'];
        $precio=$row['prezo_aluguer'];
        $fecha=$row['alugado_en'];
        $ISBN=$row['ISBN'];
        $justificante .="$ISBN\t$titulo    \t\t$precio €\t\t\t$fecha\n";
    } 
    echo $justificante;
    exit;
?>