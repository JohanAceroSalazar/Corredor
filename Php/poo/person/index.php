<?php
    include('library/person.php');
    include('library/apprentices.php');
    include('library/teacher.php');


    $apprentices= new Apprentices();
    $teacher= new Teacher();
    $teacher-> setTeacher ('Andres Moreno');
    $teacher-> setTitle ('Ing. System');
    $apprentices-> setNames ('Johan Alexander');
    $apprentices-> setLastNames ('Acero Salazar');
    $apprentices-> setIdentification ('1138274651');
    $apprentices-> setBirthDay ('25-09-2007'); 
    $apprentices-> setTelephoneContact ('3209222026');
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <body>
        <?php

            echo "Teacher: ".$teacher->getTeacher();
            echo "<br/>";
            echo "Title: ".$teacher->getTitle();
            echo "<br/>";
            echo "Student: ".$apprentices->getNames();
            echo "<br/>";
            echo "Last Name: ".$apprentices->getLastNames();
            echo "<br/>";
            echo "Identification: ".$apprentices->getIdentification();
            echo "<br/>";
            echo "BirthDay: ".$apprentices->getBirthDay();
            echo "<br/>";
            echo "Telephone: ".$apprentices->getTelephoneContact();
        ?> 

    </body>
</html>