<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\ChangePassRequest;
use App\Http\Requests\Admin\loginRequest;
use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;



class loginController extends Controller
{
    public function getLogin()
    {
        return view('admin.Auth.login');
    }
    public function login(Request $request)
    {
         $remember_me = $request->has('remember_me') ? true : false;
        $credentials = $request->only('email', 'password');
         $token = Auth::guard('admin')->attempt($credentials);
        // if (!$token)
        //     return redirect()->back()->with(['error' => 'عذرا المعلومات المدخلة غير صحيحة']);

        $arr=StudentChart();
        return redirect()->route('admin.dashboard',$arr);
    }

    public function logout()
    {
        try {
            Auth::guard('admin')->logout();
            return redirect()->route('get.admin.login');
        } catch (\Exception $ex) {
            return redirect()->back();
        }
    }

    public function  changePassword(Request $request)
    {
        return view('admin.password');
    }

    public function  updatePassword(Request $request)
    {

        $admin_id = Auth::guard('admin')->user()->id;
        $admin =Admin::find($admin_id);

        if (Hash::check($request->oldPassword, $admin->password)) {
            if ($request->newPassword == $request->oldPassword) {
                return redirect()->back()->with(['error' => 'كلمة السر الجديدة مطابقة لكلمة السر القديمة']);
            }
            if ($request->newPassword != $request->confirmation_password) {
                return redirect()->back()->with(['error' => 'كلمة السر الجديدة والتاكيد غير متطابقين']);
            }

            $admin->password = bcrypt($request->newPassword);
            $admin->save();

            return redirect()->route('admin.dashboard')->with(['success' => 'تم تغير كلمة السر بنجاح']);
        } else {
            return redirect()->back()->with(['error' => 'كلمة السر الحالية غير صحيحة']);
        }
    }


    public function dashboard(){
        $result =DB::select(DB::raw("SELECT count(*) as total_city ,city FROM students GROUP BY city"));
        $chartData ="";
        foreach($result as $list){
            $chartData .= "['".$list->city."'  , ".$list->total_city."],";
        }
        $arr['chartData'] =rtrim($chartData,",");

        return view('admin.dashboard',$arr);
    }
}
