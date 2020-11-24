<?php
for ($i=0; $i < 4; $i++) { //recorremos primero filas y despues columnas
    echo "\n";
    for ($j=0; $j < 4; $j++) { 
    $cuatroxcuatro[$i][$j]=rand(10,99);   //Genera los elementos de la matrix 4x4. Se eligen numeros de 2 cifras para que quede vistoso sin romperse la cabeza.
    }
}

echo "Elementos de la matriz \n \n";

for ($i=0; $i < 4; $i++) { 
    echo "\n";
    for ($j=0; $j < 4; $j++) { 
    echo "|",$cuatroxcuatro[$i][$j]; // Nos muestra los elementos del array.
    }
    echo "|";
}

echo "\n\nDiagonal principal \n \n";


for ($i=0; $i < 4; $i++) { 
    echo "\n";
    for ($j=0; $j < 4; $j++) { 
    if ($i==$j) {
        $numdiag=$cuatroxcuatro[$i][$j];  // Nos aseguramos que solo los elementos de la diagonal principal aparecen. 
    }
    else {
        $numdiag="  ";
    }
    echo "|",$numdiag; // Nos muestra los elementos del array.
    }
    echo "|";
}

echo "\n\nPrimera fila \n \n";


for ($i=0; $i < 4; $i++) { 
    echo "|",$cuatroxcuatro[$i][0]; // Nos muestra los elementos del array.
}
echo "|";
