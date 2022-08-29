<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\StudentRequest;
use App\Models\Student;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class StudentController extends Controller
{
    public function index()
    {
        $students = Student::get();
        return view('admin.student.index', compact('students'));
    }

    public function create()
    {
        return view('admin.student.create');
    }

    public function store(StudentRequest $request)
    {
        try {
            DB::beginTransaction();
    
            $student = Student::create([
                'firstName' => $request->firstName,
                'lastName' => $request->lastName,
                'user_name' => $request->firstName . '-' . $request->lastName,
                'email' => $request->email,
                'password' => bcrypt($request->password),
                'mobile' => $request->mobile,
                'age' => $request->age,
                'gender' => $request->gender,
                'city' => $request->city,
                'university_college' => $request->university_college,
                'academic_year' => $request->academic_year,
                'description' => $request->description,
            ]);
            $student->assignRole('student');
            DB::commit();
            return redirect()->route('students')->with(['success' => 'تم تسجيل الطالب بنجاح']);
        } catch (\Exception $ex) {
            DB::rollBack();
            return redirect()->route('students')->with(['error' => 'some things went wrongs']);
        }
    }

    public function show($student_id)
    {
        $student = Student::where('id', $student_id)->first();
        // return $user-> student ->university_card ;
        if (!$student)
            return redirect()->back()->with(['error' => 'student not found']);

        return view('admin.student.show', compact('student'));
    }


    public function edit($student_id)
    {
        $student = Student::where('id', $student_id)->first();

        if (!$student)
            return redirect()->back()->with(['error' => 'student not found']);

        return view('admin.student.edit', compact('student'));
    }

    public function update(StudentRequest $request, $student_id)
    {

        $student = Student::where('id', $student_id)->first();
        
        if (!$student)
            return redirect()->back()->with(['error' => 'student not found']);

        $student->firstName = $request->input('firstName',$student->firstName);
        $student->lastName = $request->input('lastName',$student->lastName);
        $student->user_name = $student->firstName . '-' . $student->lastName;
        $student->mobile = $request->input('mobile',$student->mobile);
        $student->age = $request->input('age',$student->age);
        $student->gender = $request->input('gender',$student->gender);
        $student->city = $request->input('city',$student->city);
        $student->university_college = $request->input('university_college',$student->university_college);
        $student->academic_year = $request->input('academic_year',$student->academic_year);
        $student->description = $request->input('description',$student->description);
      
        $student->save();
       
        
        return redirect()->route('students')->with(['success' =>  'updated successfully']);
    }

    public function delete($student_id)
    {
        try {
            $student = student::where('id', $student_id)->first();
            if (!$student)
                return redirect()->route('students')->with(['error' => 'user not found']);

            
    
            deleteImage($student->university_card);
            
            $student->delete();
            return redirect()->route('students')->with(['success' => 'deleted successfully']);
        } catch (\Exception $ex) {
            return redirect()->route('students')->with(['error' => 'deleted failed']);
        }
    }
}
