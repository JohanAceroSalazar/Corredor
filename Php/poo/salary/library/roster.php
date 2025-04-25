<?php

    class Roster {
        
    const SALARY_MINIMUM = 1300000;
    const SUBSIDY_TRANSPORTATION = 140650;

    private Person $person;
    private Discount $discount;
    private float $subsidy = 0.0;
    private float $totalPay = 0.0;

    public function __construct(Person $person, Discount $discount) {
        $this->person = $person;
        $this->discount = $discount;
    }

    public function calculatePay(): float {
        $salary = $this->person->calculateSalary();
        $totalDiscount = $this->discount->calculateTotal();

        $this->subsidy = ($salary < 2 * self::SALARY_MINIMUM) ? self::SUBSIDY_TRANSPORTATION : 0;
        $this->totalPay = ($salary + $this->subsidy) - $totalDiscount;

        return $this->totalPay;
    }

    public function getSubsidy(): float {
        return $this->subsidy;
    }

    public function getTotalPay(): float {
        return $this->totalPay;
    }
}
