<?php

class licenseC extends student{
    private string $typeLicense;
    private int $cost;
    private int $daysDuration;

    public function __construct(string $typeLicense, int $cost, int $daysDuration){
        $this->typeLicense = $typeLicense;
        $this->cost = $cost;
        $this->daysDuration = $daysDuration;
    }
    public function getTypeLicense(): string{
        return $this->typeLicense;
    }
    public function getCost(): int{
        return $this->cost;
    }
    public function getDaysDuration(): int{
        return $this->daysDuration;
    }
}
