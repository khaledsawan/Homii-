<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Spatie\Permission\Traits\HasRoles;


class Student extends Authenticatable implements JWTSubject
{
    use HasRoles ;
    protected $fillable =['firstName','lastName','email','password','user_name','mobile',
    'points','city','gender','university_college','academic_year','university_card','age','description'];

    protected $hidden =['password'];

    public function getUniversityCardAttribute($value){
        return  $value  != null ? asset($value) : '' ;  // asset('/'.$value)
    }

    public function house(){
        return $this->belongsTo('App\Models\House','house_id');
    }

    public function orderRegister(){
        return $this->hasOne('App\Models\OrderRegister','student_id');
    }

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }
}
