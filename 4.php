<?php
for ($x = 0; $x <= 20; $x++) {
    $nota1=rand(1,10);
    $nota2=rand(1,10);
    $media=$nota1+$nota2;
    switch ($media){
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
            $alumno='petardo ';
            break;
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
            $alumno='Patético ';
            break;
        case 11:
        case 12:
        case 13:
        case 14:
            $alumno='Bluff ';
            break;
        case 15:
        case 16:
        case 17:
            $alumno='Sobrevalorado ';
            break;
        case 18:
        case 19:
        case 20:
            $alumno='Tipico pelota ';
            break;
    }
    echo $alumno;
    echo $media,'
    ';
}
?>
