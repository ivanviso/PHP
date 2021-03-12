<?PHP
include 'mysqlcon.php';
include 'redirect.php';
session_start();
foreach($_POST as $ISBN => $null) { //Asi podemos distinguir que libro se va a devolver basado en el valor del nombre del formulario.
    $result=mysqli_query($conn,"insert into libro_devolto(ISBN,id_aluguer,prezo_aluguer,devolto_en,usuario) select ISBN,id_aluguer,prezo_aluguer,NOW(),usuario from libro_alugado where ISBN=$ISBN");
    //$result=mysqli_query($conn, "update libro_aluguer set cantidade = cantidade + 1 where ISBN=$ISBN");
    $result=mysqli_query($conn, "delete FROM libro_alugado where ISBN=$ISBN AND usuario='".$_SESSION['usuario']."'");
}
js_redirect('../devolver.php');
?>