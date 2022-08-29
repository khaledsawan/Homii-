<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\User\LoginRequest;
use App\Models\Student;
use App\User;
use Illuminate\Http\Client\ResponseSequence;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class LoginController extends Controller
{
    public function login(LoginRequest $request)
    {
        $credentails = $request->only(['email', 'password']);
        $token = Auth::guard('student')->attempt($credentails);

        if (!$token) {
            $token = Auth::guard('office')->attempt($credentails);
            if (!$token) {
                $token = Auth::guard('donor')->attempt($credentails);
                if (!$token) {
                    return response()->json(['message' => ['login failed']], 430);
                }
                $user = Auth::guard('donor')->user();
                if ($user->status == 0)
                    return response()->json(['message' => ['please verfiy account']], 430);
                $user->role = 'donor';
                $user->token = $token;
                return response()->json(['data' => $user]);
            }
            $user = Auth::guard('office')->user();
            $user->role = 'office';
            $user->token = $token;
            return response()->json(['data' => $user]);
        }

        $user = Auth::guard('student')->user();
        $user->role = 'student';
        $user->token = $token;

        return response()->json(['data' => $user]);
    }

    public function logout()
    {
        // try {
        if (Auth::guard('student')->check()) {
            Auth('student')->logout();
        }
        elseif(Auth::guard('office')->check()){
            Auth('office')->logout();
        }
        elseif(Auth::guard('donor')->check()){
            Auth('donor')->logout();
        }
        else{
            return Response()->json(['message' => ['User is not logged in.']],430);
        }
        return Response()->json(['message' => ['logged out successfully']]);
        // } catch (\Exception $ex) {
        //     return response()->json(['message' => ['sorry ,some thigs went wrongs']]);
        // }
    }

    public function  changePassword(Request $request)
    {
        $user_id = Auth::guard('student')->user()->id;
        $user = User::find($user_id);

        if (Hash::check($request->oldPassword, $user->password)) {
            if ($request->newPassword == $request->oldPassword) {
                return response()->json(['message' => ['new password  match old password ']], 450);
            }
            if ($request->newPassword != $request->confirmation_password) {
                return response()->json(['message' => ['new password not match confirmation password']], 450);
            }

            $user->password = bcrypt($request->newPassword);
            $user->save();
            return response()->json(['message' => ['password changed successfully']]);
        } else {
            return response()->json(['message' => ['old password not match ']], 450);
        }
    }

    public function addPoints(Request $request){
        $validator =Validator::make($request->all(),['points'=>'required|numeric|max:9']);
        if($validator->fails())
            return response()->json($validator->errors(),422);
         $user_id = Auth::guard('student')->user()->id;
        $user =Student::find($user_id);
        $user->points =$request->points ;
        $user->save();
        return response()->json(['message'=>['Requests have been successfully registered']]);
    }

}
