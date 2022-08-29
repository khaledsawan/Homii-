<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Donor;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;

class DonorRegisterController extends Controller
{
    public function index(){
        $donors =Donor::where('status',0)->get();
        return view('admin.Donor_register.index',compact('donors'));
    }

    public function show($donor_id){
        $donor =Donor::find($donor_id);
        if(! $donor || $donor->status != 0)
            return redirect()->back()->with(['error'=>'المتبرع غير موجود']);

        return view('admin.Donor_register.show',compact('donor'));
    }

    public function accept($donor_id){
        $donor =Donor::find($donor_id);
        if(! $donor || $donor->status != 0)
            return redirect()->back()->with(['error'=>'المتبرع غير موجود']);

        $role= Role::where('name','donor')->first();
        $donor->assignRole($role);
        $donor->status =1 ;
        $donor->save();
        return redirect()->route('donor.registers')->with(['success'=>'تم القبول بنجاح']);
    }

    public function delete($donor_id){
        $donor =Donor::find($donor_id);
        if(! $donor || $donor->status != 0)
            return redirect()->back()->with(['error'=>'المتبرع غير موجود']);

        $donor->delete();
        return redirect()->route('donor.registers')->with(['success'=>'تم الحذف بنجاح']);
    }
}
