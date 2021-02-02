<?php
$maximo=0;
for ($i=1; $i <= 10; $i++) { 
    $NumerosEnteros[]=rand(0,1000);
}
foreach ($NumerosEnteros as $j => $entero) {
    echo "entero : ", $entero, "\n ";
    if ($entero > $maximo) {
        $maximo=$entero;
    }
    echo "maximo : ", $maximo, "\n ";
}
echo "el maximo es: ", $maximo;
?>