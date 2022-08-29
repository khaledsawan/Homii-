<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Mail\AcceptRegister;
use App\Models\House;
use App\Models\Register;
use App\Models\Student;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;

class RegistersController extends Controller
{
    public function index()
    {
        $req_register = Register::where('status', 0)->get();
        return view('admin.student_reg.index', compact('req_register'));
    }

    public function show($register_id)
    {
        $register = Register::where('id', $register_id)->where('status', 0)->first();
        if (!$register)
            return redirect()->back()->with(['error' => 'request not found']);

        return view('admin.student_reg.show', compact('register'));
    }

    public function acceptRegister($register_id)
    {

        // try {
            DB::beginTransaction();
            $register = Register::find($register_id);
            if (!$register)
                return redirect()->back()->with(['error' => 'request not found']);

            $path = Str::after($register->university_card, 'register_photo/');
            $newPath = '/images/register_photo/' . $path;
            $newImage = '/images/student_photo/' . $path;
            File::copy(public_path() . $newPath, public_path() . $newImage);

            $student = Student::create([
                'firstName' => $register->firstName,
                'lastName' => $register->lastName,
                'email' => $register->email,
                'password' => $register->password,
                'user_name' => $register->firstName . '-' . $register->lastName,
                'mobile' => $register->mobile,
                'gender' => $register->gender,
                'age' => $register->age,
                'city' => $register->city,
                'university_college' => $register->university_college,
                'academic_year' => $register->academic_year,
                'description' => $register->description,
                'point' => $register->point,
                'university_card' => $newImage,       ////////////////update image
            ]);
            
            // $student->assignRole('student');

            // deleteImage($register->university_card);
            $register->delete();

            Mail::to($student->email)->send(new AcceptRegister($student->user_name));
            DB::commit();
            return redirect()->route('registers')->with(['success' => ' تم قبول الطلب بنجاح ']);
        // } catch (\Exception $ex) {
        //     DB::rollBack();
        //     return redirect()->route('registers')->with(['error' => 'some things went wrongs']);
        // }
    }




    public function rejectRequest($register_id)
    {
        $register = Register::find($register_id);
        if (!$register)
            return redirect()->back()->with(['error' => 'register not found']);

        deleteImage($register->university_card);
        $register->delete();
        return redirect()->route('registers')->with(['success' => 'deleted successfully']);
    }



    #####################################
    public function test()
    {
        return  $house = House::withCount('students')->first();
    }
}
