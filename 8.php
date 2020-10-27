<?php
$numero=rand(0,50);
$suma=0;
echo "numero: ",$numero,"\n";
    for ($i=1; $i <= $numero; $i++) { 
        $suma+=$i;
    }
echo "suma: ", $suma;
?>