<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Tymon\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements JWTSubject
{
    use Notifiable;

    protected $fillable = [
        'firstName','lastName','user_name', 'email', 'password','mobile','role'
    ];


    protected $hidden = [
        'password', 'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }


    ####################### Relations

    // public function student(){
    //     return $this->hasOne('App\Models\Student','user_id');
    // }

    // public function office(){
    //     return $this->hasOne('App\Models\Office','user_id');
    // }

    // public function houses(){
    //     return $this->hasOne('App\Models\House','office_id');
    // }

    // public function StudentHmoe(){
    //     return $this->
    // }
}
