<?php
require_once 'library/student.php';
require_once 'library/licenseA.php';
require_once 'library/licenseB.php';
require_once 'library/licenseC.php';

$student = new student("Juan Sebastian", "Sanchez Gomez", "36461278", "Calle 10 #23-45", "3123245849", "O+");
$licenseA = new licenseA("Motocicleta", 750000, 25);
student("Licencia A", $student, $licenseA);

$student = new student("Stiven", "Perdomo", "24578954", "Cra 35 n25", "3147815994", "O-");
$licenseB = new licenseB("Vehiculos Particulares", 900000, 35);
student("Licencia B", $student, $licenseB);

$student = new student("Johana", "Gutierrez", "77845136", "Calle 25 n23", "1148726548", "A+");
$licenseC = new licenseC("Vehiculos de Servicio Publico", 950000, 45);
student("Licencia C", $student, $licenseC);

function student($titulo, $student, $license) {
    echo "<h2>$titulo</h2>";
    echo "<p><strong>Nombre Completo:</strong> " . $student->getNames() . " " . $student->getLastNames() . "</p>";
    echo "<p><strong>Identificación:</strong> " . $student->getIdentification() . "</p>";
    echo "<p><strong>Dirección:</strong> " . $student->getAddress() . "</p>";
    echo "<p><strong>Teléfono:</strong> " . $student->getTelephone() . "</p>";
    echo "<p><strong>RH:</strong> " . $student->getRh() . "</p>";
    echo "<p><strong>Tipo de Licencia:</strong> " . $license->getTypeLicense() . "</p>";
    echo "<p><strong>Costo del Curso:</strong> $" . number_format($license->getCost(), 0, ',', '.') . "</p>";
    echo "<p><strong>Duración del Curso:</strong> " . $license->getDaysDuration() . " días</p>";
}
