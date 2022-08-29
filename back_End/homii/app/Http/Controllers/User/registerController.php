<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\User\registerRequest;
use App\Models\Register;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Symfony\Component\HttpFoundation\File\Exception\UploadException;

class registerController extends Controller
{
    public function register(registerRequest $request){
        try{
        DB::beginTransaction();
        $path =uploadImage('register_photo',$request->university_card);

        $register= Register::create([
            'firstName'=>$request->firstName,
            'lastName'=>$request->lastName,
            'email'=>$request->email,
            'password'=>bcrypt($request->password),
            'age'=>$request->age,
            'city'=>$request->city,
            'gender'=>$request->gender,
            'mobile'=>$request->mobile,
            'university_college'=>$request->university_college,
            'academic_year'=>$request->academic_year,
            'description'=>$request->description,
            'university_card'=>$path ,
          ]);
          DB::commit();
        return response()->json(['message'=>'your request has been successfully registered']);
        }
        catch(\Exception $ex){
            DB::rollBack();
            return response()->json(['message'=>'some things went wrong']);
        }
    }

    
}
