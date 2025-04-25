<?php

    abstract class worker{

        private float $salary;
        private int $riskLevel;
        
        public function __construct(float $salary, int $riskLevel) {
            $this->salary = $salary;
            $this->riskLevel = $riskLevel;
        }
        public function getSalary(): float{
            return $this->salary;
        }
        public function getRiskLevel(): int{
            return $this->riskLevel;
        }

        abstract public function calculateTotalSalary(): float;
    }
