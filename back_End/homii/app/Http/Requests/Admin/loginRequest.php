<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

class loginRequest extends FormRequest
{
    
    public function authorize()
    {
        return true;
    }
    
    public function rules()
    {
        return [
            'email'=>'required',
            'password'=>'required|min:8'
        ];
    }

    // public function messages()
    // {
    //     return [
    //         'email.required'=>'يجب ادخال البريد الالكتروني',
    //         'password.required'=>'يجب ادخال كلمة السر ',
    //         'password.min'=>'يجب ان تكون كلمة السر اكثر من ثمانية محارف',
    //     ];
    // }
}
