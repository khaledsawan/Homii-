<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTotalDonationsTable extends Migration
{
  
    public function up()
    {
        Schema::create('total_donations', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('total_donations');
            $table->timestamps();
        });
    }

   
    public function down()
    {
        Schema::dropIfExists('total_donations');
    }
}
