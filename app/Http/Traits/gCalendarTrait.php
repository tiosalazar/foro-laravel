<?php
namespace App\Http\Traits;


use App\Http\Controllers\gCalendarController;

trait gCalendarTrait {
    public $clientGoogle;


    public function getClientGoogle() {
        $calendar =new gCalendarController();
        //$clientGoogle = $this->getClientGoogle();
        return $calendar->returnClient();

        // Get all the brands from the Brands Table.
        //return $calendar->returnClient();
    }
    public function setClientGoogle($clientGoogle) {
        $this->$clientGoogle=$clientGoogle;
    }
}
