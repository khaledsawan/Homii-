<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Donations extends Model
{
    protected $fillable = ['donor_id', 'balance','status'];


    public function donor()
    {
        return $this->belongsTo('App\Models\Donor', 'donor_id');
    }
}
