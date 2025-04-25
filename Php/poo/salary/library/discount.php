<?php

    class discount extends person {
    private $health;
    private $pension;
    private $arl;
    private $total;
    
    public function __construct($health, $pension, $arl) {
        $this->health = $health;
        $this->pension = $pension;
        $this->arl = $arl;
        $this->total = 0;
    }

    public function calculateTotal(): float {
        $this->total =  $this->health->calculateDiscount() +
                        $this->pension->calculateDiscount() +
                        $this->arl->calculateDiscount();
        return $this->total;
    }

    public function getHealth(): float {
        return $this->health->calculateDiscount();
    }

    public function getPension(): float {
        return $this->pension->calculateDiscount();
    }

    public function getArl(): float {
        return $this->arl->calculateDiscount();
    }

    public function getTotal() {
        return $this->total;
    }
}