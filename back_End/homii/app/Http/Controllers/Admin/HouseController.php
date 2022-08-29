<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\HouseRequest;
use App\Models\House;
use App\Models\Office;
use App\User;
use Illuminate\Http\Request;

class HouseController extends Controller
{
    public function index(){
        $houses = House::get();
        return view('admin.house.index',compact('houses'));
    }

    public function create(){
         $offices =Office::select('id','name')->get();
        return view('admin.house.create',compact('offices'));
    }

    public function store(HouseRequest $request){

        $house =House::create([
            'office_id'=>$request->office_id ,
            'number_students'=>$request->number_students ,
            'number_room'=>$request->number_room ,
            'address'=>$request->address ,
            'description'=>$request->description ,
            'price'=>$request->price ,
        ]);

        return redirect()->route('houses')->with(['success'=>'تم اضافة المنزل بنجاح']);
    }

    public function edit($house_id){
        $house =House::find($house_id);
        $offices = Office::select('id','name')->get();
        if(!$house)
            return redirect()->route('houses')->with(['error' =>'المنزل غير موجود']);

        return view('admin.house.edit',compact('house','offices'));
    }

    public function update(HouseRequest $request,$house_id){
        $house =House::find($house_id);
        if(!$house)
            return redirect()->route('houses')->with(['error' =>'المنزل غير موجود']);

        $house->office_id = $request->input('office_id',$house->office_id);
        $house->number_students = $request->input('number_students',$house->number_students);
        $house->number_room = $request->input('number_room',$house->number_room);
        $house->price = $request->input('price',$house->price);
        $house->address = $request->input('address',$house->address);
        $house->description = $request->input('description',$house->description);

        $house->save();
        return redirect()->route('houses')->with(['success' =>'تم التعديل بنجاح']);

    }

    public function show($house_id){
        $house =House::with(['office'=>function($q){
            $q->select('id','name');
        }])->find($house_id);
        if(!$house)
            return redirect()->back()->with(['error' =>'المنزل غير موجود']);
        
        return view('admin.house.show',compact('house'));
    }

    public function delete($house_id){
        
        $house =House::find($house_id);
        if(!$house)
            return redirect()->back()->with(['error' =>'المنزل غير موجود']);

        $house->delete();
        return redirect()->route('houses')->with(['success' =>'تم الحذف بنجاح']);
    }

}
