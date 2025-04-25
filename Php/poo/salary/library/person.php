<?php

    class person {

    private $name;
    private $lastName;
    private $identification;
    private $dayValue;
    private $daysWorked;

    public function __construct($name, $lastName, $identification, $dayValue, $daysWorked) {
        $this->name = $name;
        $this->lastName = $lastName;
        $this->identification = $identification;
        $this->dayValue = $dayValue;
        $this->daysWorked = $daysWorked;
    }

    public function getName(): string {
        return $this->name;
    }

    public function getlastName(): string {
        return $this->lastName;
    }
    
    public function getIdentification(): int {
        return $this->identification;
    }

    public function getDayValue(): float {
        return $this->dayValue;
    }

    public function getDaysWorked(): int {
        return $this->daysWorked;
    }

    public function calculateSalary(): float {
        return $this->dayValue * $this->daysWorked;
    }
}