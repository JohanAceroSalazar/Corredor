<?php

    include('library/person.php');
    include('library/health.php');
    include('library/pension.php');
    include('library/arl.php');
    include('library/discount.php');
    include('library/roster.php');

    $person = new person("Laura", "Martínez", 36304597, 50000, 30);

    $salary = $person->calculateSalary();

    $health = new Health($salary);
    $pension = new Pension($salary);
    $arl = new Arl($salary);

    $discount = new discount($health, $pension, $arl);

    $roster = new roster($person, $discount);
    $roster->calculatePay();

echo "Persona: " . $person->getName() . " " . $person->getLastName(). "<br/>";
echo "Identificación: " . $person->getIdentification(). "<br/>";
echo "Salario: $" . number_format($salary, 0, ',', '.'). "<br/>";
echo "Salud: $" . number_format($discount->getHealth(), 0, ',', '.'). "<br/>";
echo "Pensión: $" . number_format($discount->getPension(), 0, ',', '.'). "<br/>";
echo "Arl: $" . number_format($discount->getArl(), 0, ',', '.'). "<br/>";
echo "Descuento: $" . number_format($discount->getTotal(), 0, ',', '.'). "<br/>";
echo "Subsidio transporte: $" . number_format($roster->getSubsidy(), 0, ',', '.'). "<br/>";
echo "Total a pagar: $" . number_format($roster->getTotalPaY(), 0, ',', '.'). "<br/>";
