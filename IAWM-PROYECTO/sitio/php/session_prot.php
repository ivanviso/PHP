<?php
include 'redirect.php';
//Nos deja proteger la pagina de usuarios sin sesion.
session_start();

if ( isset( $_SESSION['login'] ) ) {
    if ($_SESSION['admin']) {
        $admin=true;
    }else {
        $admin=false;
    }
    
} else {
    js_redirect('/login.php');
}
?>