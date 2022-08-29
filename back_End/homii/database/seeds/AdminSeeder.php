<?php

use App\Models\Admin;
use Illuminate\Database\Seeder;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $admin =Admin::create([
            'firstName'=>'mohamad',
            'lastName'=>'elawi',
            'email'=>'mohamad@gmail.com',
            'password'=>bcrypt('123456789'),
        ]);

        $admin =Admin::create([
            'firstName'=>'rama',
            'lastName'=>'alswedani',
            'email'=>'rama@gmail.com',
            'password'=>bcrypt('123456789'),
        ]);

        $admin =Admin::create([
            'firstName'=>'raneem',
            'lastName'=>'herfi',
            'email'=>'raneem@gmail.com',
            'password'=>bcrypt('123456789'),
        ]);
    }
}
