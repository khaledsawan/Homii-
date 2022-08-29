<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OfficeRegister extends Model
{
    protected $fillable =['name','email','password','mobile','address','description','status'];
    
    protected $hidden = [] ;
}
