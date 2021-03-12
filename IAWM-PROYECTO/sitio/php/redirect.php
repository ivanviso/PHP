<?php
//Utilizamos javascript para refrescar la pagina porque reduce las posibilidades de que cargue parte que no debe del cache. 
function js_redirect($URL) {
    echo "<script>window.location.replace(\"$URL\")</script>";
}
?>