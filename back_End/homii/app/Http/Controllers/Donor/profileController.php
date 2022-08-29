<?php

namespace App\Http\Controllers\Donor;

use App\Http\Controllers\Controller;
use App\Http\Requests\Donor\DonataionRequest;
use App\Http\Requests\Donor\profileRequest;
use Illuminate\Http\Request;
use App\Models\Donations;
use App\Models\Donor;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class profileController extends Controller
{
    public function donation(DonataionRequest $request)
    {
        DB::beginTransaction();
        $user = Auth::guard('donor')->user();
        if (!$user)
            return response()->json(['message' => ['لا توجد صلاحية']],403);

        // $validated = $request->validate([
        //     'balance' => 'required|numeric',
        // ]);
        // if (!$validated) {
        //     response()->json(["message" => ['ادخل المبلغ مالي رقماً حصراً']],422);
        // }
        
        $donation = new Donations();
        $donation->donor_id =$user->id;
        $donation->balance = $request->balance;
        $donation->save();
        DB::commit();
        return response()->json(["message" => ["تم أضافة المبلغ بنجاح"]]);
    }


    public function updateProfile(profileRequest $request)
    {
        $user = Auth::guard('donor')->user();

        if (!$user)
            return response()->json(['message' => ['لا توجد صلاحية']],403);

        $donor = Donor::find($user->id);
        $donor->name = $request->input('name',$donor->name);
        $donor->address = $request->input('address',$donor->address);
        $donor->phone = $request->input('phone',$donor->phone);
        $donor->work_details = $request->input('work_details',$donor->name);
        $donor->save();
        return response()->json(["message" => ["تم تحديث الملف الشخصي بنجاح"]]);
    }

    public function show(){
        $user = Auth::guard('donor')->user()->only(['name','address','phone','work_details']);

        if (!$user)
            return response()->json(['message' => ['لا توجد صلاحية']],403);

        return response()->json(['data',$user]);
    }
    
    public function myDonation()
    {
        $user =Auth::guard('donor')->user();

        if(!$user )
            return response()->json(['message'=>['لا توجد صلاحية']],403);

        $donations = Donations::where('donor_id',$user->id)->where('status',1)->orderBy('created_at', 'DESC')->get();
        $total = 0 ;
        foreach($donations as $donation){
            $total = $total + $donation->balance ;
        }
        return response()->json(['data'=>$donations ,'total'=>$total]);
    }
}
