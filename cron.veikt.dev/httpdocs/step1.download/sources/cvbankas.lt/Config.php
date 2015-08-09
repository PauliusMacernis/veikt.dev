<?php

class Config {

    const DELAY_MIN = 3;
    const DELAY_MAX = 20;

    private $black_list_chars_page_numbers = array('-','/', '|', ' ', "\n", "\r", '.');
    private $delay = 0;

    public function __set($name, $value) {
        $this->$name = $value;
    }

    public function __get($name) {
        switch($name) {
            case 'delay':
                return rand(self::DELAY_MIN, self::DELAY_MAX);
            default:
                return $this->$name;
        }
    }

}