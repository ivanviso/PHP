<?php
$query_prueba="SELECT count(*) from usuario as cuenta where usuario='$username'";  // comprobamos que no exiten otros usuarios con el mismo nombre.
$query="INSERT INTO usuario(usuario,contrasinal,direccion,telefono,nifdni,fecha_registro) VALUES ('$username','$hashpass','$addr',$tlf,'$dni',NOW())"; // necesitamos insertar en dos tablas.
$query2="INSERT INTO novo_rexistro(usuario,contrasinal,direccion,telefono,nifdni) VALUES ('$username','$hashpass','$addr',$tlf,'$dni')";

include 'php/tests.php'; // realizamos las comprobaciones de las variables en este fichero. 

if (empty($errores)) { //insertamos en la base de datos, si no hay ningun error. 
    mysqli_query($conn,$query);
    mysqli_query($conn,$query2); 
}
mysqli_commit($conn);
mysqli_close($conn);
?>