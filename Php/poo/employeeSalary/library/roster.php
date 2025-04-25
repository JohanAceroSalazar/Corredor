<?php
require_once 'library/worker.php';
require_once 'library/employee.php';

class roster{
    const MIN_WAGE = 1300000;

    public function calculateTotalSalary(employee $employee): float {
        $salary = $employee->getSalary();
        $subsidy = $this->calculateSubsidy($salary);
        $netSalary = $employee->calculateTotalSalary();
        return $subsidy + $netSalary;
    }

    public function calculateSubsidy($salary): float {
        return $salary < (2 * self::MIN_WAGE) ? self::MIN_WAGE : 0;
    }
}



