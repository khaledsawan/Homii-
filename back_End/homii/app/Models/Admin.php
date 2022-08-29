<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Spatie\Permission\Traits\HasRoles;

class Admin extends Authenticatable 
{
    use HasRoles;

    protected $fillable =['firstName','lastName','email','password'];

    protected $hidden =[];

    
}
