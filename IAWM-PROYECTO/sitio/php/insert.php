<?php
$query_prueba="SELECT count(usuario) from usuario as cuenta where usuario='$username'";  // comprobamos que no exiten otros usuarios con el mismo nombre.
//$query="INSERT INTO usuario(usuario,contrasinal,direccion,telefono,nifdni,fecha_registro,nome) VALUES ('$username','$hashpass','$addr',$tlf,'$dni',NOW(),'$nombre')"; // necesitamos insertar en dos tablas.
$query="REPLACE INTO novo_rexistro(usuario,contrasinal,direccion,telefono,nifdni,nome) VALUES ('$username','$hashpass','$addr',$tlf,'$dni','$nombre')";

include 'php/tests.php'; // realizamos las comprobaciones de las variables en este fichero. 

if (empty($errores)) { //insertamos en la base de datos, si no hay ningun error. 
    mysqli_query($conn,$query);
    mysqli_query($conn,$query2); 
    include 'php/redirect.php';
    js_redirect('/login.php'); // nos lleva a la pagina de login si todo va bien. 
}
mysqli_commit($conn);
mysqli_close($conn);
?>