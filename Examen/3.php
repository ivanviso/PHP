<?php
$numero=rand(0,500);
echo "numero: ",$numero,"\n"; // Se usa un numero aleatorio para comprobar que funciona bien.
    for ($i=0; $i < $numero+1; $i++) { 
        if ($i % 4 == 0) {
            $div4[] = $i; // al a;adir un valor a un array de esta manera, si no existe el array se crea. Asi que no hace falta inicializarlo.
        }
    }
echo "cantidad de divisibles de 4 : ",count($div4),"\nnumeros: ";
for ($i=1; $i < count($div4); $i++) { 
    echo $div4[$i],",";
}
?>
