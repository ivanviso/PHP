<?php
for ($i=0; $i < 5; $i++) { 
    $entero=rand(0,100);
    echo "entero: ",$entero,"\n";
    $a=1;
    $impares=0;
    $pares=0;
    while ($a <= $entero) {
        if ($a % 2 != 0) {
            $impares+=$a;
        } else {
            $pares+=$a;
        }
    $a++;
    }
    echo "impares: ",$impares,"\n";
    echo "pares: ",$pares,"\n";
    echo "---------------\n";
}
?>