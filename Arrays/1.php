<?php
for ($i=0; $i < 3; $i++) { 
    for ($j=0; $j < 5; $j++) { 
    $tresPorCinco[$i][$j]=rand();
    echo "fila ", $i+1, " columna ", $j+1," : ", $tresPorCinco[$i][$j], "\n";
    }
}

?>