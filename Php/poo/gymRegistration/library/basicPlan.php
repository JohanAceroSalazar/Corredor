<?php

    class basicPlan extends user{
        private float $cost = 60000.0; 
        private string $showServices;

    public function __construct(string $names, string $lastnames, int $identification, float $weight, float $height) {
        parent::__construct($names, $lastnames, $identification, $weight, $height);
    }

    public function showServices(): void {
        echo "Plan Basico - Servicios:<br>";
        echo " Acceso General al Gym <br>";
    }

    public function getCost(): float {
        return $this->cost;
    }
}