<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderRegister extends Model
{
    protected $guarded =[];
    // protected $fillable =['student_id','house_id','office_id','type','price','newPrice',] ;
    
    protected $hidden =[] ;


    ########### Relation 

    public function student(){
        return $this->belongsTo('App\Models\Student','student_id');
    }

    public function house(){
        return $this->belongsTo('App\Models\House','house_id');
    }

    public function office(){
        return $this->belongsTo('App\Models\Office','office_id');
    }

}