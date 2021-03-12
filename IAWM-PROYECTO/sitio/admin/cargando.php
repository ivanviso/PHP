<?php
include '../php/redirect.php';
    echo "Cargando...";
    sleep(1); 
    unset($_SERVER["REQUEST_METHOD"]);
    unset($_POST);
    js_redirect('/admin/libro_mod.php');
// Necesitamos esto para evitar que el formulario cargue valores incorrectos del cache. 
?>