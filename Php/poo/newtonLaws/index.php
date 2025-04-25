<?php

require_once('library/firstLaw.php');
require_once('library/secondLaw.php');
require_once('library/thirdLaw.php');

$opcion = 1; 

switch ($opcion) {
    case 1:
        $firstLaw = new firstLaw();
        $firstLaw->explain();
        echo "<br>";
        $firstLaw->calculate(0);
        break;

    case 2:
        $secondLaw = new secondLaw();
        $secondLaw->explain();
        echo "<br>";
        $secondLaw->calculate(7, 6);
        break;

    case 3:
        $thirdLaw = new thirdLaw();
        $thirdLaw->explain();
        echo "<br>";
        $thirdLaw->calculate(9);
        break;

    default:
        echo "Opción inválida";
        break;
}


