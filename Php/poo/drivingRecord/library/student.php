<?php

class student{

    private String $names;
    private String $lastNames;
    private String $identification;
    private String $address;
    private String $telephone;
    private String $rh;


    public function __construct(String $names, String $lastNames, String $identification, String $address, String $telephone, String $rh){
            $this->names = $names;
            $this->lastNames = $lastNames;
            $this->identification = $identification;
            $this->address = $address;
            $this->telephone = $telephone;
            $this->rh = $rh;
    }

    public function getNames():String {
        return $this->names;
    }
    public function getLastNames():String {
        return $this->lastNames;
    }
    public function getIdentification():String {
        return $this->identification;
    }
    public function getAddress():String {
        return $this->address;
    }   
    public function getTelephone():String {
        return $this->telephone;
    }
    public function getRh():String {
        return $this->rh;
    }
}