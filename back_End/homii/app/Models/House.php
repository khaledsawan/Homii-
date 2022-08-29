<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class House extends Model
{
    protected $fillable =['office_id','address','number_students','number_room','price','description','rented'];

    protected $hidden =[];

    public function office(){
        return $this->belongsTo('App\Models\Office','office_id');
    }

    public function students(){
        return $this->hasMany('App\Models\Student','house_id');
    }

    public function orderRegisters(){
        return $this->hasMany('App\Models\OrderRegister','house_id');
    }
   
}
