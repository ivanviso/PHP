<?php
$query_prueba="SELECT count(*) from usuario where usuario='$username'";  // comprobamos que no exiten otros usuarios con el mismo nombre.
$query="INSERT INTO usuario(usuario,contrasinal,direccion,telefono,nifdni,fecha_registro) VALUES ('$username','$hashpass','$addr',$tlf,'$dni',NOW())"; // necesitamos insertar en dos tablas.
$query2="INSERT INTO novo_rexistro(usuario,contrasinal,direccion,telefono,nifdni) VALUES ('$username','$hashpass','$addr',$tlf,'$dni')";

if (empty($errores)) { //insertamos en la base de datos, si no hay ningun error. 
    mysqli_query($conn,$query);
    mysqli_query($conn,$query2); 
}

mysqli_commit($conn);
mysqli_close($conn);
?>