<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\OrderRegister;
use Illuminate\Http\Request;

class RentalRegisterController extends Controller
{
    public function index(){
        $orders = OrderRegister::with('student')->get();
        return $orders;
    }
}
