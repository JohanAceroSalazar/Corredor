<?php
    include('library/figureGeometric.php');
    include('library/triangle.php');
    include('library/square.php');
    include('library/rectangle.php');
    include('library/circle.php');

$triangle = new Triangle(8, 5);
$square = new Square(6);
$rectangle = new Rectangle(3, 9);
$circle = new Circle(4); 

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
    <?php 
    echo $triangle->getName() . "<br/>";
        echo "Base: " . $triangle->getBase() . "<br/>";
        echo "Altura: " . $triangle->getHeight() . "<br/>";
        echo "Area: " . $triangle->calculateArea() . "<br/><br/>";

    echo $square->getName() . "<br/>";
        echo "Lado: " . $square->getSide() . "<br/>";
        echo "Area: " . $square->calculateArea() . "<br/><br/>";

    echo $rectangle->getName() . "<br/>";
        echo "Base: " . $rectangle->getBase() . "<br/>";
        echo "Altura: " . $rectangle->getHeight() . "<br/>";
        echo "Area: " . $rectangle->calculateArea() . "<br/><br/>";

    echo $circle->getName() . "<br/>";
        echo "Radio: " . $circle->getRadius() . "<br/>";
        echo "Area: " . $circle->calculateArea();
    ?>
</body>
</html>