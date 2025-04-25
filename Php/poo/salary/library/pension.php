<?php

    class pension extends person {
    private $valuePension;
    
    public function __construct($valuePension) {
        $this->valuePension = $valuePension;
    }

    public function getValuePension(): float  {
        return $this->valuePension;
    }

    public function calculateDiscount(): float {
        $this->calculate = ($this->getValuePension() * 0.04);
        return $this->calculate;
    }
}