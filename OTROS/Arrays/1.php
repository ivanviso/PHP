<?php
echo "\n A \n";
for ($i=0; $i < 3; $i++) { 
    echo "\n";
    for ($j=0; $j < 5; $j++) { 
    $tresPorCinco[$i][$j]=rand();
    echo "fila ", $i+1, " columna ", $j+1," : ", $tresPorCinco[$i][$j], "\n";
    }
}

echo "\n B \n";
for ($j=0; $j < 5; $j++) { 
    echo "\n";
    for ($i=0; $i < 3; $i++) { 
    $tresPorCinco[$i][$j]=rand();
    echo "columna ", $j+1, " fila ", $i+1," : ", $tresPorCinco[$i][$j], "\n";
    }
}
?>