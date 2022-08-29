<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Register extends Model
{
    

    protected $fillable =['firstName','lastName','email','password','city','age','mobile'
    ,'gender','university_college','academic_year','university_card','description','status'];

    protected $hidden =[];

    public function getUniversityCardAttribute($value){
        return  $value  != null ? asset($value) : '' ; 
    }
}
