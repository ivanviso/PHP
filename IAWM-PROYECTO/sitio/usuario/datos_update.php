<?php
include '../php/mysqlcon.php';
include '../php/redirect.php';
session_start();
$usuario=$_SESSION['usuario'];
$sqlupd=$_SESSION['sqlu'];
if ($_POST['nov_data']) {
    if ($_POST['v1']==$_POST['v2']) {
        $val=$_POST['v1'];
        $sql="UPDATE usuario set $sqlupd='$val' where usuario='$usuario'";
        mysqli_query($conn, $sql);
        js_redirect('perfil.php');
    } else {
        echo '<h3 class=error> Los datos no son iguales</h3>';
    }
}
unset($_SESSION['sqlu']);
?>