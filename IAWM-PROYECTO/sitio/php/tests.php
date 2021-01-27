<?php
if ($_SERVER['REQUEST_METHOD']=='POST') {
unset($errores);
$errores="";
    if (mysqli_connect_errno()) {
        $errores.="<br>Failed to connect to MySQL: " . mysqli_connect_error();
    }
    if (empty($username)) {
        $errores.="<br>El nombre de usuario esta vacio";
    }
    if (strlen($pass) < 8){
        if (empty($pass)) {
            $errores.="<br>La contrasena esta vacia";
        } else {
            $errores.="<br>La contrasena es demasiado corta";
        }
    }
    if (empty($nombre)) {
        $errores.="<br>El nombre esta vacio";
    }
    if (empty($addr)) {
        $errores.="<br>La direccion esta vacia";
    }
    // POR HACER : comprobar el CRC del DNI si me sobra tiempo.

    if (!strlen($dni) == 9) {
        if (empty($dni)) {
            $errores.="<br> El DNI esta vacio";
        }
        else {
            $errores.="<br> El DNI es incorrecto";
        }
    }

    if (!is_numeric($tlf)) {
        if (empty($tlf)) {
            $errores.="<br> El telefono esta vacio";
        }
        else {
            $errores.="<br> El telefono es incorrecto";
        }
    }
     if (mysqli_query($conn,$query_prueba) == 0) { 
        $errores.="<br>El nombre de usuario ya existe";
        } 
}

?>