<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Spatie\Permission\Traits\HasRoles;
use Tymon\JWTAuth\Contracts\JWTSubject;

class Donor extends Authenticatable implements JWTSubject
{
    use HasRoles;
    protected $fillable =['name','email','password','phone','address','work_details','total_balance','status'];

    protected $hidden =['password'];


    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }
}
