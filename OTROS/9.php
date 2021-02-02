<?php
$total=0;
for ($i=1; $i <= 20; $i++) { 
    $NumerosReales[]=rand(0,100000)/100;
}
foreach($NumerosReales as $j =>$ventas){
    $total+=$ventas;
    $media=$total/20;
}
echo "la media es: ", $media;
?>