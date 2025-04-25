<?php
    include('library/user.php');
    include('library/basicPlan.php');
    include('library/mediumPlan.php');
    include('library/premiumPlan.php');
    
    $basicUser = new basicPlan("Johan", "Gomez Valenzuela", 1138475478, 60.5, 1.60);
    $mediumUser = new mediumPlan("Juan Carlos", "Pérez Guilombo", 36314785, 80.2, 1.80);
    $premiumUser = new premiumPlan("Valentina", "Pedraza Saenz", 55489736, 57.0, 1.72);

        echo "<h4>Basic Plan User:</h4>";
        echo "Name: " . $basicUser->getNames() . " " . $basicUser->getLastNames();
        echo "<br>";
        echo "Identificacion: " . $basicUser->getIdentification();
        echo "<br>";
        echo "Weight: " . $basicUser->getWeight() . " kg";
        echo "<br>";
        echo "Height: " . $basicUser->getHeight() . " m";
        echo "<br>";
        $basicUser->showServices();
        echo "<br><strong>Total Costo: $" . number_format($basicUser->getCost(), 0, ',', '.') . " COP</strong>";
        echo "<br><hr>";

        echo "<h4>Medium Plan User:</h4>";
        echo "Name: " . $mediumUser->getNames() . " " . $mediumUser->getLastNames();
        echo "<br>";
        echo "Identificacion: " . $mediumUser->getIdentification();
        echo "<br>";
        echo "Weight: " . $mediumUser->getWeight() . " kg";
        echo "<br>";
        echo "Height: " . $mediumUser->getHeight() . " m";
        echo "<br>";
        $mediumUser->showServices();
        echo "<br><strong>Total Costo: $" . number_format($mediumUser->getCost(), 0, ',', '.') . " COP</strong>";
        echo "<br><hr>";

        echo "<h4>Premium Plan User:</h4>";
        echo "Name: " . $premiumUser->getNames() . " " . $premiumUser->getLastNames();
        echo "<br>";
        echo "Identificacion: " . $premiumUser->getIdentification();
        echo "<br>";
        echo "Weight: " . $premiumUser->getWeight() . " kg";
        echo "<br>";
        echo "Height: " . $premiumUser->getHeight() . " m";
        echo "<br>";
        $premiumUser->showServices();
        echo "<br><strong>Total Costo: $" . number_format($premiumUser->getCost(), 0, ',', '.') . " COP</strong>";
    