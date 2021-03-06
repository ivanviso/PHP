<?php
include 'mysqlcon.php';
require '../pdf/fpdf.php';
    session_start();
    $usuario=$_SESSION['usuario'];
    $fichero='justificante-'.$usuario.'.pdf';
    header('Content-Type: application/octet-stream');
    header('Content-Disposition: attachment; filename='.basename($fichero));
    header('Expires: 0');
    header('Cache-Control: must-revalidate');
    header('Pragma: public');
//str_pad nos sirve para mantener todos los campos de tamaño variable a un tamaño constante, para poder alinearlos.
    $justificante="JUSTIFICANTE\t$usuario\n--------------------------------------------------------------------------------\n";
    $justificante.="LIBROS ALUGADOS\n";
    $justificante.=str_pad("libro",57)."\t\tprecio\talugado en\n";
    $result = mysqli_query($conn, "select libro_aluguer.ISBN,alugado_en,usuario,titulo,libro_aluguer.prezo_aluguer FROM libro_aluguer JOIN libro_alugado ON libro_aluguer.ISBN = libro_alugado.ISBN where usuario='$usuario'");
    while ($row = mysqli_fetch_assoc($result)) {
        $titulo=$row['titulo'];
        $titulo=str_pad($titulo,42);
        $titulo=str_split($titulo,42)[0];
        $precio=$row['prezo_aluguer'];
        $fecha=$row['alugado_en'];
        $ISBN=$row['ISBN'];
        $justificante.="$ISBN\t$titulo    \t$precio €\t$fecha\n";
    }
    $justificante.="-------------------------------------------------------------------------------------\n";
    $justificante.="LIBROS DEVOLTOS\n";
    $justificante.=str_pad("libro",57)."\tprecio\tdevolto en\n";
    $result = mysqli_query($conn, "select libro_aluguer.ISBN,devolto_en,usuario,titulo,libro_devolto.prezo_aluguer FROM libro_aluguer JOIN libro_devolto ON libro_aluguer.ISBN = libro_devolto.ISBN where usuario='$usuario'");
    while ($row = mysqli_fetch_assoc($result)) {
        $titulo=$row['titulo'];
        $titulo=str_pad($titulo,42);
        $titulo=str_split($titulo,42)[0];
        $precio=$row['prezo_aluguer'];
        $fecha=$row['devolto_en'];
        $ISBN=$row['ISBN'];
        $justificante.="$ISBN\t$titulo    \t$precio €\t$fecha\n";
    }
    $justificante.="-------------------------------------------------------------------------------------\n";
    $justificante.="LIBROS COMPRADOS\n"; 
    $justificante.=str_pad("libro",57)."\tprecio\tcomprado en\n";
    $result = mysqli_query($conn, "select libro_aluguer.ISBN,vendido_en,usuario,titulo,libro_aluguer.prezo FROM libro_aluguer JOIN libro_venda ON libro_aluguer.ISBN = libro_venda.ISBN where usuario='$usuario'");
    while ($row = mysqli_fetch_assoc($result)) {
        $titulo=$row['titulo'];
        $titulo=str_pad($titulo,42);
        $titulo=str_split($titulo,42)[0];
        $precio=$row['prezo'];
        $fecha=$row['vendido_en'];
        $ISBN=$row['ISBN'];
        $justificante .="$ISBN\t$titulo    \t$precio €\t$fecha\n";
    }
$pdf = new FPDF('P','mm',array(220,12000));$pdf->AddPage(); // Define el ancho y alto de la pagina. Altura muy elevada para imitar carrillo de papel. Convertir a tamaño dinamico deberia ser posible. 
$pdf->SetFont('Courier','',11);
$pdf->Write(12,iconv('UTF-8', 'windows-1252', $justificante)); // FPDF requiere que la string sean convertidas a el formato nativo de la fuente que se va a usar. 
$pdf->Output();
exit;
?>