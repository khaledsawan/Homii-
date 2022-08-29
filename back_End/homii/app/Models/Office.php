<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Spatie\Permission\Traits\HasRoles;


class Office extends Authenticatable implements JWTSubject
{
    use HasRoles;

    protected $fillable = ['name','email','password','mobile','address','description'];

    protected $hidden = [];

    public function houses(){
        return $this->hasMany('App\Models\House','office_id');
    }

    public function orderRegisters(){
        return $this->hasMany('App\Models\OrderRegister','office_id');
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
