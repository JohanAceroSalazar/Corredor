<?php

class user{

    private String $names;
    private String $lastNames;
    private int $identification;
    private float $weight;
    private float $height;
    
    public function __construct(String $names, String $lastNames, int $identification, float $weight, float $height){
            $this->names = $names;
            $this->lastNames = $lastNames;
            $this->identification = $identification;
            $this->weight = $weight;
            $this->height = $height;
    }

    public function getNames():String {
        return $this->names;
    }
    public function getLastNames():String {
        return $this->lastNames;
    }
    public function getIdentification():int {
        return $this->identification;
    }
    public function getWeight():float{
        return $this->weight;
    }   
    public function getHeight():float {
        return $this->height;
    }
}