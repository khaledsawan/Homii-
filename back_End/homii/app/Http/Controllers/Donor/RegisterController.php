<?php

namespace App\Http\Controllers\Donor;

use App\Http\Controllers\Controller;
use App\Http\Requests\Donor\DonorRegisterRequest;
use App\Models\Donor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RegisterController extends Controller
{
    public function register(DonorRegisterRequest $request)
    {

        try {
            DB::beginTransaction();
            $register = Donor::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => bcrypt($request->password),
                'phone' => $request->phone,
                'address' => $request->address ,
                'work_details'=>$request->work_details ,
            ]);
            DB::commit();
            return response()->json(['message' => 'your request has been successfully registered']);
        } catch (\Exception $ex) {
            DB::rollBack();
            return response()->json(['message'=>'some things went wrong']);
        }
    }
    
}
