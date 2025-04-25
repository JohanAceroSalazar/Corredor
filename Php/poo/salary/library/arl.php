<?php

    class arl extends person {
    private $valueArl;
    
    public function __construct($valueArl) {
        $this->valueArl = $valueArl;
    }

    public function getValueArl(): float  {
        return $this->valueArl;
    }

    public function calculateDiscount(): float  {
        $this->calculate = ($this->getValueArl() * 0.005);
        return $this->calculate;
    }
}