<?php
$numero=rand(0,100); // Se usa un numero aleatorio para comprobar que funciona bien con multiples valores

$multiplo5=array();
$multiplo7=array(); // Declaramos los arrays como tales aunque vacios. Porque de lo contrario no son declarados y PHP lanza un error al tratar de contarlos

echo "numero: ",$numero,"\n"; 
    for ($i=1; $i < $numero; $i++) { 
        if ($i % 5 == 0) {
            $multiplo5[] = $i;  
        }
        if ($i % 7 == 0) {
            $multiplo7[] = $i;
        }
    }
    echo "\n\ncantidad de multiplos de 5 : ",count($multiplo5),"\nnumeros: "; //contamos los elementos del array
    
    foreach ($multiplo5 as $value) {                                //lo recorremos para mostrar sus valores
        echo $value,",";                                            // Se utiliza un foreach en lugar de un for por que de lo contrario nos puede lanzar error con valores nulos
    }

    echo "\n\ncantidad de multiplos de 7 : ",count($multiplo7),"\nnumeros: ";
    foreach ($multiplo7 as $value) {                                
        echo $value,",";                                            
    }
?>