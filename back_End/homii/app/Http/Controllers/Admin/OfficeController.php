<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\OfficRequest;
use App\Models\Office;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class OfficeController extends Controller
{
    public function index()
    {
        $offices = Office::get();
        return view('admin.office.index', compact('offices'));
    }

    public function create(Request $request)
    {
        return view('admin.office.create');
    }

    public function store(OfficRequest $request)
    {
        try {
            DB::beginTransaction();

            $office = Office::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password),
                'mobile' => $request->mobile,
                'address' => $request->address,
                'description' => $request->description
            ]);

            $office->assignRole('office');
            DB::commit();
            return redirect()->route('offices')->with(['success' => 'تم اضافة المكتب بنجاح']);
        } catch (\Exception $ex) {
            DB::rollback();
            return redirect()->route('offices')->with(['error' => ' حدث خطا ما ']);
        }
    }


    public function show($office_id)
    {
        $office = Office::find($office_id);

        if (!$office)
            return redirect()->back()->with(['error' => 'المكتب غير موجود']);

        return view('admin.office.show', compact('office'));
    }

    public function edit($office_id)
    {
        $office =  Office::find($office_id);

        if (!$office)
            return redirect()->back()->with(['error' => 'المكتب غير موجود']);

        return view('admin.office.edit', compact('office'));
    }

    public function update(Request $request, $office_id)
    {
        $office = Office::where('id', $office_id)->first();
        if (!$office)
            return redirect()->back()->with(['error' => 'المكتب غير موجود']);


        $office->name = $request->input('name', $office->name);
        $office->mobile = $request->input('mobile', $office->mobile);
        $office->address = $request->input('address', $office->address);
        $office->description = $request->input('description', $office->description);

        $office->save();
        

        return redirect()->route('offices')->with(['success' => 'تم التعديل بنجاح']);
    }


    public function delete($office_id)
    {
         $office = Office::find($office_id);

        if (!$office)
            return redirect()->back()->with(['error' => 'المكتب غير موجود']);

        $office->delete();
       

        return redirect()->route('offices')->with(['success' => 'تم حذف المكتب بنجاح']);
    }
}
