<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\House;
use App\Models\Office;
use App\Models\Order;
use App\Models\OrderRegister;
use App\Models\TotalDonations;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HouseOrderController extends Controller
{
    public function index()
    {
        $houses = House::where('number_students', 4)->orWhere('number_students', 3)->where('rented', 0)
            ->orderBy('number_students', 'DESC')->get();

        return view('admin.house_order.index', compact('houses'));
    }

    public function show($house_id)
    {
        $house = House::with(['office' => function ($q) {
            $q->select('id', 'name');
        }])->find($house_id);
        if (!$house)
            return redirect()->back()->with(['error' => 'المنزل غير موجود']);

        return view('admin.house_order.show', compact('house'));
    }

    public function showOffice($office_id)
    {
        $office = Office::find($office_id);

        if (!$office)
            return redirect()->back()->with(['error' => 'المكتب غير موجود']);

        return view('admin.house_order.office_show', compact('office'));
    }

    public function showStudents($house_id)
    {
        $students = DB::table('houses')->join('order_registers', 'houses.id', '=', 'order_registers.house_id')
            ->join('students', 'students.id', '=', 'order_registers.student_id')
            ->select('students.id', 'students.firstName', 'students.lastName', 'students.email', 'students.mobile', 'order_registers.newPrice')
            ->where('order_registers.house_id', $house_id)->get();
        return view('admin.house_order.show_students', compact('students'));
    }

    public function deleteOrderStudent($student_id)
    {
        $studentOrder = OrderRegister::where('student_id', $student_id)->first();

        if (!$studentOrder)
            return redirect()->back()->with(['error' => 'الطلب غير موجود']);


        $house = House::find($studentOrder->house_id);

        if (!$studentOrder)
            return redirect()->back()->with(['error' => 'المنزل غير موجود']);

        $house->decrement('number_students');
        $studentOrder->delete();
        return redirect()->back()->with(['success' => 'تم الحذف بنجاح']);
    }

    public function acceptOrderHouse($house_id)
    { /// add expire date
        DB::beginTransaction();

        $house = House::find($house_id);
        if (!$house)
            return redirect()->back()->with(['error' => 'المنزل غير موجود']);

        $order_students = OrderRegister::where('house_id', $house_id)->get();
        $amount = 0;
        foreach ($order_students as $value) {
            $amount = $amount + $value->newPrice;
        }

        $help_amount =($house->price - $amount) * 12 ;

        $total = TotalDonations::first();
        $total->total_donations;

        if($total->total_donations < $help_amount) {
            return redirect()->back()->with(['error' => 'لا يوجد مال يكفي لحجز المنزل']);  //// maybe change 
        }

        $total->total_donations -= $help_amount;
        $total->save();

        foreach ($order_students as $value) {
            Order::create([
                'student_id' => $value->student_id,
                'house_id' => $value->house_id,
                'office_id' => $value->office_id,
                'price' => $value->price,
                'newPrice' => $value->newPrice,
            ]);

            $value->delete();
        }

        $house->rented = 1;
        $house->save();
        DB::commit();

        return redirect()->back()->with(['success' => 'تم قبول طلب الايجار بنجاح']);
    }

    public function rejectOrderHouse($house_id){
        $house = House::find($house_id);
        if (!$house)
            return redirect()->back()->with(['error' => 'المنزل غير موجود']);

        $order_students = OrderRegister::where('house_id', $house_id)->get();

        foreach ($order_students as $value) {
            $value->delete();
        }
        return redirect()->back()->with(['success' => 'تم رفض طلب الايجار بنجاح']);
    }
}
