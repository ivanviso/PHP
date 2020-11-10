<?php 
function cua($numero) {
    global $cuadrado;
    $cuadrado=$numero*$numero;
}
$num=rand(1,100);
echo $num,"\n";
cua($num);
echo $cuadrado;
?>