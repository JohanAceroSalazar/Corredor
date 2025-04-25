<?php

        class circle extends figureGeometric{
        
            private float $radius;
            private float $calculate;

        public function __construct(float $radius){
            parent::__construct("Circle");
            $this->radius = $radius;
        }

        public function getRadius(): float {
            return $this->radius;
        }
    
        public function calculateArea(): float {
            $this->calculate = Pi() * pow($this->radius,2);
            return $this->calculate;
        }
    }