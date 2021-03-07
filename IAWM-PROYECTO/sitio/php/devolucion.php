<?PHP
include 'mysqlcon.php';
include 'redirect.php';

foreach($_POST as $ISBN => $null) { //Asi podemos distinguir que libro se va a devolver basado en el valor del nombre del formulario.
    $result=mysqli_query($conn, "delete FROM libro_alugado where ISBN=$ISBN");
    $result=mysqli_query($conn, "update libro_aluguer set cantidade = cantidade + 1 where ISBN=$ISBN");
}

js_redirect('../devolver.php');
?>