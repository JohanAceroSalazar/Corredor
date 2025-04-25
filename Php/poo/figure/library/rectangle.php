<?php

    class rectangle extends figureGeometric{
    
        private $base;
        private $height;
        private $calculate;
    
    public function __construct($base,$height){
        parent::__construct("Rectangle");
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
        $this->calculate = ($this->getBase() * $this->getHeight());
        return $this->calculate;
    }
}