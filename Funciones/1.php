<?php
function parono($numero) {
    if ($numero % 2 == 0 ) {
        echo $numero," es par";

    }
    else {
        echo $numero," es inpar";
    }
}
parono(rand(-100,100));

?>