<?php
include '../php/redirect.php';

session_start();

if (isset($_SESSION['login'])) {
    if ($_SESSION['admin']) {
        $admin = true;
    } else {
        $admin = false;
    }

} else {
    js_redirect('/login.php');
}

if (!$admin) {
    js_redirect('/login.php');
}
