<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStudentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('students', function (Blueprint $table) {
            $table->id();
            $table->string('firstName');
            $table->string('lastName');
            $table->string('user_name');
            $table->string('email')->unique();
            $table->string('password');
            $table->string('mobile');
            $table->string('gender');
            $table->string('age');
            $table->string('city');
            $table->string('university_college');
            $table->string('academic_year');
            $table->string('university_card')->nullable();
            $table->text('description')->nullable();
            $table->integer('points')->nullable()->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('students');
    }
}
