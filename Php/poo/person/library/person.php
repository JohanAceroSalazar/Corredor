<?php
    class person{
    private ?int $identification;
    private ?string $names;
    private ?string $lastNames;
    private ?string $birthday;

            public function getIdentification(){
                return $this-> identification;
            }
            public function setIdentification(int $identification){
                $this-> identification = $identification;
            }
            public function getNames(){
                return $this->names;
            }
            public function setNames(?string $names){
                $this-> names = $names;  
            }
            public function getLastNames(){
                return $this-> lastNames;
            }
            public function setLastNames(?string $lastNames){
                $this-> lastNames = $lastNames; 
            } 
            public function getBirthDay(){
                return $this->birthDay;
            }
            public function setBirthDay(?string $birthDay){
                $this-> birthDay= $birthDay; 
            }

    }