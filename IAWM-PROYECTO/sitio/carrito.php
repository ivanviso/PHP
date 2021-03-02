<?PHP 
session_start();

if(isset($_POST['ISBNa'])) {
    $ISBN_ALQUILER=$_POST['ISBNa'];
    foreach ($ISBN_ALQUILER as $key) {
        $_SESSION['carrito_alquiler'][]=$key;
    }
}
if(isset($_POST['ISBNc'])) {
    $ISBN_COMPRA=$_POST['ISBNc'];
    foreach ($ISBN_COMPRA as $key) {
        $_SESSION['carrito_compra'][]=$key;
    }
}



?>