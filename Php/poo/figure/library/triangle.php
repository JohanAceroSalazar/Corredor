<?php

        class triangle extends figureGeometric{
        
        private $base;
        private $height;
        private $calculate;
            
    public function __construct($base,$height){
        parent::__construct("Triangle");
        $this->base = $base;
        $this->height = $height;
    }

    public function getBase(){
        return $this->base;
    }

    public function getHeight(){
        return $this->height;
    }

    public function calculateArea(): float {
        $this->calculate = ($this->getBase() * $this->getHeight()) / 2;
        return $this->calculate;
    }
}



    
    
    

