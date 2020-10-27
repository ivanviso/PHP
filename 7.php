<?php
$cuadrados=0;
$cubos=0;
$numero=rand(0,50);
echo "numero: ",$numero,"\n";
    for ($i=1; $i < $numero; $i++) { 
        $cuadrados+=pow($i,2);
        $cubos+=pow($i,3);
    }
echo $cuadrados,"\n";
echo $cubos,"\n";
?>