<?php
include 'redirect.php';
// You'd put this code at the top of any "protected" page you create

// Always start this first
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