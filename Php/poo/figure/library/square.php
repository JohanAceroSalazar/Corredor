<?php
    
        class square extends figureGeometric{
            private $side;
            private $calculate;
        
        public function __construct($side){
            parent::__construct("Square");
            $this->side=$side;
        }

        public function getSide(){
            return $this->side;
        }

        public function calculateArea(): float {
            return $this->side * $this->side;
            return $this->calculate;
        }
    }

    