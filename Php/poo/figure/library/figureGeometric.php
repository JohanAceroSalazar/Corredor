<?php
    abstract class figureGeometric{
        private string $name;

        public function __construct(String $name){
            $this->name = $name;
            
        }
        public function getName(): string{
        return $this->name;

        }
        
        abstract public function calculateArea(): float;
        
    }