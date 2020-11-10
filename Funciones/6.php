<?php 
function muestranumero($numero) {
    global $numero2;
    $numero2=$numero;
    echo $numero2;
}
muestranumero(rand());
?>