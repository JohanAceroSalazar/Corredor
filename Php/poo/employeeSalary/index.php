<?php

require_once 'library/worker.php';
require_once 'library/employee.php';
require_once 'library/roster.php'; 

$salary = 1300000;          
$riskLevel = 2;            
$extraHoursDay = 6;            
$extraNightHours = 2;      
$extraHolidayHours = 5;     

$employee = new employee($salary, $riskLevel, $extraHoursDay, $extraNightHours, $extraHolidayHours);
$roster = new roster($salary, $riskLevel);

$extras = $employee->calculateExtraPayments();
$deductions = $employee->calculateDeductions();
$netSalary = $employee->calculateTotalSalary();
$subsidy = $roster->calculateSubsidy($salary);
$totalWithSubsidy = $roster->calculateTotalSalary($employee);

echo "Pago total del empleado:<br>";
echo "Salario base: $" . number_format($salary, 2) . "<br>";
echo "Horas extra: $" . number_format($extras, 2) . "<br>";
echo "Deducciones (Salud + Pensión + ARL): $" . number_format($deductions, 2) . "<br>";
echo "Salario neto: $" . number_format($netSalary, 2) . "<br>";
echo "Subsidio de transporte: $" . number_format($subsidy, 2) . "<br>";
echo "Pago total (neto + subsidio): $" . number_format($totalWithSubsidy, 2) . "<br>";
