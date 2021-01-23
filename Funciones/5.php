<?php
function multi($num1,$num2) {
    global $producto;
    $producto=$num1*$num2;
    echo $num1," ",$num2," ",$producto;
}
multi(rand(0,100),rand(0,100))
?>