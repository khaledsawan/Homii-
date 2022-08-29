<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\DonorRequest;
use App\Models\Donations;
use App\Models\Donor;
use App\Models\TotalDonations;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class DonorController extends Controller
{
    public function index()
    {
        $donors = Donor::where('status', 1)->orderBy('created_at','DESC')->get();
        return view('admin.Donor.index', compact('donors'));
    }

    public function show($donor_id)
    {
        $donor = Donor::find($donor_id);
        if (!$donor)
            return redirect()->back()->with(['error' => 'المتبرع غير موجود']);

        return view('admin.Donor.show', compact('donor'));
    }

    public function create()
    {
        return view('admin.Donor.create');
    }

    public function store(DonorRequest $request)
    {
        try{
            DB::beginTransaction();
        $donor = Donor::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'phone' => $request->phone,
            'address' => $request->address,
            'work_details' => $request->work_details,
            'status' => 1,
        ]);

        $donor->assignRole('donor');
        DB::commit();
        return redirect()->route('donors')->with(['success' => 'تم اضافة المتبرع بنجاح']);
    }catch(\Exception $ex){
        DB::rollBack();
        return redirect()->back()->with(['error' => 'حدثت مشكلة ما']);
    }
    }

    public function edit($donor_id)
    {
        $donor = Donor::find($donor_id);
        if (!$donor)
            return redirect()->back()->with(['error' => 'المتبرع غير موجود']);

        return view('admin.Donor.edit', compact('donor'));
    }

    public function update(Request $request,$donor_id)
    {
        $donor = Donor::find($donor_id);
        if (!$donor)
            return redirect()->back()->with(['error' => 'المتبرع غير موجود']);
        
        $donor->name =$request->input('name',$donor->name);
        $donor->phone =$request->input('phone',$donor->phone);
        $donor->address =$request->input('address',$donor->address);
        $donor->work_details =$request->input('work_details',$donor->work_details);
        $donor->status =$request->input('status',$donor->status);

        $donor->save();

        return redirect()->route('donors')->with(['success' => 'تم التعديل بنجاح']);
    }

    public function delete($donor_id)
    {
        $donor = Donor::find($donor_id);
        if (!$donor)
            return redirect()->back()->with(['error' => 'المتبرع غير موجود']);

        DB::table('donations')->where('donor_id', $donor_id)->delete();
        $donor->delete();
        return redirect()->route('donors')->with(['success' => 'تم الحذف بنجاح']);
    }

    public function viewDonations($donor_id)
    {
        $donor = Donor::find($donor_id);
        if (!$donor)
            return redirect()->back()->with(['error' => 'المتبرع غير موجود']);
        
        $donations =Donations::where('donor_id',$donor_id)->where('status',1)->orderBy('created_at','DESC')->get();
        return view('admin.Donor.view_donation',compact('donations'));
    }

    public function totalDonation(){
        $total = TotalDonations::first();
        return view('admin.Donor.total_donation',compact('total'));
    }

    public function requestDonations()
    {
         $donations=Donations::with('donor')->where('status',0)->orderBy('created_at','DESC')->get();
        return view('admin.Donor.request_donations',compact('donations'));
    }

    public function accept($id)
    {
        DB::beginTransaction();
        $donation =Donations::find($id);
        if(! $donation)
              return redirect()->back()->with(['error' => 'الطلب غير موجود']);
        
        $total =TotalDonations::first();
        $total->total_donations = $total->total_donations + $donation->balance ;
        $total->save();

        $donor = Donor::find($donation->donor_id);
        $donor->total_balance = $donor->total_balance + $donation->balance;
        $donor->save();

        $donation ->status =1 ;
        $donation->save();
        DB::commit();
        return redirect()->back()->with(['success' => 'تم قبول الطلب بنجاح']);
    }

    public function reject($id)
    {
        $donation =Donations::find($id);
        if(! $donation)
              return redirect()->back()->with(['error' => 'الطلب غير موجود']);

        $donation->delete();
        return redirect()->back()->with(['success' => 'تم رفض الطلب بنجاح']);
    }

    public function chart(){
        $result =DB::select(DB::raw("SELECT count(*) as total_city ,city FROM students GROUP BY city"));
        $chartData ="";
        foreach($result as $list){
            $chartData .= "['".$list->city."'  , ".$list->total_city."],";
        }


        $arr['chartData'] =rtrim($chartData,",");
        return view('admin.chart',$arr);
    }
}
