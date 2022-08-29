<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\House;
use App\Models\Office;
use App\Models\Order;
use App\Models\OrderRegister;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class HouseRentController extends Controller
{
    public function index(Request $request)
    {
        $order = $request->header('order', 'number_students');
        $user = Auth::guard('student')->user();
        $houses = House::where('number_students', '<', 4)->orderBy($order)->get();
        $houses->each(function ($house) use ($user) {
            $house->discount = ($house->price / 4) * $user->points * 0.1;
            $house->newPrice = ($house->price / 4) - $house->discount;
        });
        return response()->json(['data' => $houses]);
    }

    public function show($house_id)
    {

        $user = Auth::guard('student')->user();
        $house = House::find($house_id);
        if (!$house || $house->number_students >= 4)
            return response()->json(['message' => ['المنزل غير موجود']], 450);

        $discount = ($house->price / 4) * $user->points * 0.1;
        $house->newPrice = ($house->price / 4) - $discount;
        return response()->json(['data' => $house]);
    }

    public function rentHouse(Request $request, $house_id)
    {
        try {
            DB::beginTransaction();
            $user = Auth::guard('student')->user();

            if (OrderRegister::where('student_id', $user->id)->first() || Order::where('student_id', $user->id)->first())
                return response()->json(['message' => ['لا يمكن طلب المنزل لديك طلب مسبقا ']], 450);

            $house = House::find($house_id);
            if (!$house || $house->number_students >= 4)
                return response()->json(['message' => ['المنزل غير موجود']], 450);


            $discount = ($house->price / 4) * $user->points * 0.1;
            $newPrice = ($house->price / 4) - $discount;


            $orderRegister = OrderRegister::create([
                'student_id' => $user->id,
                'house_id' => $house->id,
                'office_id' => $house->office_id,
                'price' => $house->price,
                'newPrice' => $newPrice,
            ]);

            $house->increment('number_students');
            DB::commit();
            return response()->json(['message' => ['نم تسجيل الطلب بنجاح']]);
        } catch (\Exception $ex) {
            DB::rollback();
            return response()->json(['message' => ['عذرا يرجى اعادة المحاولة']], 460);
        }
    }

    public function cancelRent($house_id)
    {
        $user = Auth::guard('student')->user();
        $house = House::find($house_id);
        $order = OrderRegister::where('student_id', $user->id)->where('house_id', $house_id)->first();

        if (!$order)
            return response()->json(['message' => ['لا يمكن تنفيذ الطلب ']], 450);

        $house->decrement('number_students');
        $order->delete();
        return response()->json(['message' => ['تم الغاء طلب الايجار بنجاح']]);
    }

    public function test($house_id)
    {
        $house = House::find($house_id);
        return  $house->orderRegisters;
    }
}
