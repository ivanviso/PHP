<?php 
include 'mysqlcon.php';
// Insertar en compras. 
session_start();

foreach ($_SESSION['carrito_alquiler'] as $ISBN) {
    $result = mysqli_query($conn, "SELECT * FROM libro_aluguer where ISBN=$ISBN");
    while ($row = mysqli_fetch_assoc($result)) {
      $sql="insert into libro_alugado(ISBN,prezo_aluguer,alugado_en,usuario) select ISBN,prezo_aluguer,NOW(),usuario from libro_aluguer,usuario where usuario.usuario='".$_SESSION['usuario']."' AND ISBN=$ISBN";
      $sql2="update libro_aluguer set cantidade = cantidade - 1 where ISBN=$ISBN";
        mysqli_query($conn,$sql);
        mysqli_query($conn,$sql2);

    }
}
foreach ($_SESSION['carrito_compra'] as $ISBN) {
    $result = mysqli_query($conn, "SELECT * FROM libro_aluguer where ISBN=$ISBN");
    echo "<br>";
    while ($row = mysqli_fetch_assoc($result)) {
      $sql="insert into libro_venda(ISBN,prezo,vendido_en,usuario) select ISBN,prezo,NOW(),usuario from libro_aluguer,usuario where usuario.usuario='".$_SESSION['usuario']."' AND ISBN=$ISBN";
      $sql2="update libro_aluguer set cantidade = cantidade - 1 where ISBN=$ISBN";
      echo $sql,"\n",$sql2;
      mysqli_query($conn,$sql);
      mysqli_query($conn,$sql2);

    }
}
mysqli_commit($conn);
unset($_SESSION['carrito_alquiler']); unset($_SESSION['carrito_compra']); 
include 'redirect.php';
js_redirect('../devolver.php');


/*
CREATE TABLE `libro_alugado` (
  `id_aluguer` int PRIMARY KEY AUTO_INCREMENT,
  `ISBN` varchar(18),
  `prezo_aluguer` int,
  `alugado_en` datetime,
  `usuario` varchar(24)
);

CREATE TABLE `libro_venda` (
  `id_venta` int PRIMARY KEY AUTO_INCREMENT,
  `ISBN` varchar(18),
  `usuario` varchar(24),
  `prezo` int,
  `vendido_en` datetime
);

*/



?>