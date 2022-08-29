<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddTypeToHousesTable extends Migration
{
   
    public function up()
    {
        Schema::table('houses', function (Blueprint $table) {
            $table->enum('type',['individually','mutual'])->nullable();
        });
    }


    public function down()
    {
        Schema::table('houses', function (Blueprint $table) {
            $table->dropColumn('type');
        });
    }
}
