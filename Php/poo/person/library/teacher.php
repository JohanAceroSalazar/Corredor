<?php

    class teacher extends person {
        
        private ?string $title;
        private ?string $teacher;

    public function getTitle(): string|null{
        return $this->title;
    }

    public function setTitle(?string $title): void{
        $this->title=$title;
    }

    public function getTeacher(): string|null{
        return $this->teacher;
    }

    public function setTeacher(?string $teacher): void{
        $this->teacher=$teacher;
    }
}