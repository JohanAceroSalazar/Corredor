<?php

    class health extends person {
    private $valueHealth;
    
    public function __construct($valueHealth) {
        $this->valueHealth = $valueHealth;
    }

    public function getValueHealth(){
        return $this->valueHealth;
    }

    public function calculateDiscount(): float {
        $this->calculate = ($this->getValueHealth() * 0.04);
        return $this->calculate;
    }
}