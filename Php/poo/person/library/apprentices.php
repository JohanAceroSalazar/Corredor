<?php

    class apprentices extends person{

        private ?string $birthDay;
        private ?int $telephoneContact;


        public function getBirthDay(): string|null{
            return $this->birthDay;
    }    

        public function setBirthDay(?string $birthDay): void{
            $this->birthDay=$birthDay;
    }

        public function getTelephoneContact(): int|null{
            return $this->telephoneContact;
    }    

        public function setTelephoneContact(?int $telephoneContact): void{
            $this->telephoneContact=$telephoneContact;
    }

}












    