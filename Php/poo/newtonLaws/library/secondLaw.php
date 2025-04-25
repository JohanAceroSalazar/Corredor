<?php

    class secondLaw {
        private float $mass;
        private float $acceleration;
        public function explain(): void {
            echo "Segunda Ley de Newton: Establece que si una fuerza es aplicada en un objeto, la aceleracion del objeto cambiará cuando se le aplica una fuerza para moverlo, esto dependiendo de la masa del objeto.";
        }

    public function calculate(float $mass, float $acceleration):void {
        $force = $mass * $acceleration;
            echo "Fuerza resultante: " . $force . "N";
    }
}