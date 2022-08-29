<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

class HouseRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

   
    public function rules()
    {
        return [
            'office_id'=>'required|exists:offices,id',
            'address'=>'required|min:5',
            'number_students'=>'numeric',
            'number_room'=>'required|numeric|lt:7',
            'description'=>'required',
            'price'=>'required|numeric',
        ];
    }

    public function messages(){
        return [
            'required'=>"هذا الحقل مطلوب",
            'office_id.exists' =>"المكتب العقاري غير صحيح",
        ];
    }
}
