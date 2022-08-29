<?php

use App\Models\Admin;
use App\Models\Donor;
use App\Models\Office;
use App\Models\Student;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RoleSeeder extends Seeder
{
   
    public function run()
    {
        $role = Role::create(['guard_name' => 'student', 'name' => 'student']);
        $role = Role::create(['guard_name' => 'office', 'name' => 'office']);
        $role = Role::create(['guard_name' => 'donor', 'name' => 'donor']);
        $permission = Permission::create(['guard_name' => 'admin', 'name' => 'studentsMangement']);
        $permission = Permission::create(['guard_name' => 'admin', 'name' => 'officesMangement']);
        $permission = Permission::create(['guard_name' => 'admin', 'name' => 'HousesMangement']);


        $students =Student::get();
        $offices =Office::get();
        $donors =Donor::where('status',1)->get();
        $admin =Admin::where('firstName','mohamad')->first();
        $permissions =Permission::get();

        foreach($students as $student){
            $student->assignRole('student');
        }
        foreach($offices as $office){
            $office->assignRole('office');
        }

        foreach($donors as $donor){
            $donor->assignRole('donor');
        }
        foreach($permissions as $permission){
            $admin->givePermissionTo($permission);
        }

        $admin1 =Admin::where('firstName','rama')->first();
        $admin1->givePermissionTo('studentsMangement');

        $admin2 =Admin::where('firstName','raneem')->first();
        $admin2->givePermissionTo('HousesMangement');
    }
}
