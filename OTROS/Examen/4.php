<?php
$edad=rand(7,25); 
echo "el atleta de edad ",$edad," compite en la categoria : ";
switch ($edad) { 
    case 7:
    case 8:
    case 9:
    echo "Benxamin";
        break;
    case 10:
    case 11:
    echo "Alevin";
        break;
    case 12:
    case 13:
    echo "Infantil";
        break;
    case 14:
    case 15:
    echo "Cadete";
        break;
    case 16:
    case 17:
    echo "Xuvenil";
        break;
    case 18:
    case 19:
    case 20:
    echo "Junior";
        break;
    case 21:
    echo "Junior o Senior";
        break;
    default:
        echo "Senior";
        break;
}

?>
