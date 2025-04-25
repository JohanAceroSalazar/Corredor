<?php

    class mediumPlan extends user {

    private float $cost = 85000.0; 

    public function __construct(string $names, string $lastnames, int $identification, float $weight, float $height) {
        parent::__construct($names, $lastnames, $identification, $weight, $height);
    }

    public function showServices(): void {
        echo "Plan Basico - Servicios:<br>";
        echo " Acceso General al Gym <br>";
        echo " Clases Guiadas (yoga, spinning, etc.)<br>";
    }

    public function getCost(): float {
        return $this->cost;
    }
}