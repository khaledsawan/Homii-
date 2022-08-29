<?php

namespace App\Http\Controllers\Office;

use App\Http\Controllers\Controller;
use App\Http\Requests\OFfice\HouseRequest;
use App\Models\House;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HousesController extends Controller
{
    public function index()
    {
        $user =Auth::guard('office')->user();

        if(!$user )
            return response()->json(['message'=>['لا توجد صلاحية']]);

        $houses = House::where('office_id',$user->id)->orderBy('created_at', 'DESC')->get();

        return response()->json(['data'=>$houses]);
    }

  

    public function store(HouseRequest $request)
    {
        if( ! $request->has('number_students')){
            $request->number_students = 0 ;
        }
        $user_id = Auth::guard('office')->user()->id;
        $house = House::create([
            'office_id' =>    $user_id,
            'address' =>  $request->address,
            'price' =>  $request->price,
            'number_room' => $request->number_room,
            'number_students' => $request->number_students,
            'description' => $request->description,
        ]);
        return response()->json([ "message" => ['تم اضافة المنزل بنجاح']]);
    }

    public function show($house_id)
    {   
        $user=Auth::guard('office')->user();
        $house = House::find($house_id);
        if (!$house || $house->office_id != $user->id ) {
            return response()->json(['message'=>'المنزل غير موجود']);
        }
        return response()->json(['data'=>$house]);
    }


    public function update(HouseRequest $request,$house_id)
    {
        $user=Auth::guard('office')->user();
        $house = House::find($house_id);
        if (!$house || $house->office_id != $user->id ) {
            return response()->json(['message'=>'المنزل غير موجود']);
        }
      
        $house->address = $request->input('address',$house->address);
        $house->number_room = $request->input('number_room',$house->number_room);
        $house->price = $request->input('price',$house->price);
        $house->description = $request->input('description',$house->description);
      
        $house->save();
        return response()->json([ "message" => ["تم التعديل بنجاح"]]);
    }

 

    public function destroy($house_id)
    {
        $user=Auth::guard('office')->user();
        $house = House::find($house_id);
        if (!$house || $house->office_id != $user->id) 
            return response()->json(['message'=>'المنزل غير موجود']);
        
        if(count($house -> students) != 0)
            return response()->json(['message'=>['عذرا لا يمكن حذف هذالمنزل حاليا ']]);

        $house->delete();
        return response()->json (['message'=>['تم الحذف بنجاج']]);
    }
}
