<?php

    class thirdLaw {
        private float $actionForce;
        public function explain(): void {
            echo "Tercera Ley de Newton: Cuando un objeto ejerza una fuerza en otro objeto, el segundo objeto ejerce una fuerza igual frente la fuerza del primer objeto.";
        }

    public function calculate(float $actionForce): void {
        $reactionForce = -$actionForce;
        echo "Fuerza de Acción: " . $actionForce . "N<br>";
        echo "Fuerza de Reacción: ". $reactionForce . "N (reacción opuesta)";
    }
}
