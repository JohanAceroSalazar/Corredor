<?php

    class firstLaw {
        private float $force;
        public function explain(): void {
            echo "Primera Ley de Newton: Un objeto permanece en reposo o en movimiento constante si la fuerza neta es cero.";
        }

    public function calculate(float $force): void {
        if ($force == 0) {
        echo "Fuerza = 0  El objeto esta en reposo o movimiento uniforme.";
        } else {
        echo "Fuerza > 0 - El objeto esta en estado de aceleración o desaceleración.";
        }
    }
}
