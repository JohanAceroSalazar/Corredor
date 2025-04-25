<?php

require_once 'library/worker.php';

class employee {
    private float $salary;
    private int $extraHoursDay;
    private int $extraNightHours;
    private int $extraHolidayHours;
    private int $riskLevel;
    
    public function __construct(float $salary, int $riskLevel, int $extraHoursDay, int $extraNightHours, int $extraHolidayHours) {
        $this->salary = $salary;
        $this->riskLevel = $riskLevel;
        $this->extraHoursDay = $extraHoursDay;
        $this->extraNightHours = $extraNightHours;
        $this->extraHolidayHours = $extraHolidayHours;
    }

    public function getSalary(): float {
        return $this->salary;
    }

    public function calculateTotalSalary(): float {
        return $this->salary + $this->calculateExtraPayments() - $this->calculateDeductions();
    }

    public function calculateExtraPayments(): float {
        $hourlyPay = $this->salary / 240;  
        return $this->extraHoursDay * $hourlyPay * 1.25 +
               $this->extraNightHours * $hourlyPay * 1.75 +
               $this->extraHolidayHours * $hourlyPay * 2.00;
    }

    public function calculateDeductions(): float {
        $health = $this->salary * 0.04;
        $pension = $this->salary * 0.04;
        $arl = $this->calculateArl();
        return $health + $pension + $arl;
    }

    public function calculateArl(): float {
        switch ($this->riskLevel) {
            case 1: return $this->salary * 0.005;
            case 2: return $this->salary * 0.01;
            case 3: return $this->salary * 0.02;
            default: return 0;
        }
    }
}
