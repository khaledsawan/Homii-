<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Office;
use App\Models\OfficeRegister;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class officeRegisterController extends Controller
{
    public function index()
    {
        $registers = OfficeRegister::get();
        return view('admin.office_reg.index', compact('registers'));
    }

    public function show($register_id)
    {
        $register = OfficeRegister::find($register_id);

        if (!$register)
            return redirect()->back()->with(['error' => 'الطلب غير موجود']);

        return view('admin.office_reg.show', compact('register'));
    }


    public function accept($register_id)
    {

        try {
            DB::beginTransaction();
            $register = OfficeRegister::find($register_id);

            if (!$register)
                return redirect()->back()->with(['error' => 'الطلب غير موجود']);

            $office = Office::create([
                'name' => $register->name,
                'email' => $register->email,
                'password' => $register->password,
                'mobile' => $register->mobile,
                'address' => $register->address,
                'description' => $register->description,
            ]);

            $office->assignRole('office');
            $register->delete();
            DB::commit();
            return redirect()->route('office.registers')->with(['success' => 'تم قبول الطلب بنجاح']);
        } catch (\Exception $ex) {
            DB::rollback();
            return redirect()->route('office.registers')->with(['error' => ' عذرا حدثت مشكلة ما ']);
        }
    }


    public function delete($register_id)
    {
        $register = OfficeRegister::find($register_id);

        if (!$register)
            return redirect()->back()->with(['error' => 'الطلب غير موجود']);

        $register->delete();
        return redirect()->route('office.registers')->with(['success' => 'تم حذف الطلب بنجاح']);
    }
}
