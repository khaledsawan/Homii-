<?php

namespace App\Http\Controllers\Office;

use App\Http\Controllers\Controller;
use App\Http\Requests\Office\OFficeRegisterRequest;
use App\Models\OfficeRegister;
use Illuminate\Support\Facades\DB;

class RegisterController extends Controller
{
    public function register(OFficeRegisterRequest $request)
    {
        try {
            DB::beginTransaction();
            $register = OfficeRegister::create([
               'name' => $request->name ,
                'email' => $request->email,
                'password' => bcrypt($request->password),
                'address' => $request->address,
                'mobile' => $request->mobile,
                'description' => $request->description,
            ]);
            DB::commit();
            return response()->json(['message' => 'your request has been successfully registered']);
        } catch (\Exception $ex) {
            DB::rollBack();
            return response()->json(['some things went wrong']);
        }
    }
}
