<?php session_start(); unset($_SESSION['carrito_alquiler']); unset($_SESSION['carrito_compra']); 

include 'redirect.php'
js_redirect('../panel_usuario.php');
?>