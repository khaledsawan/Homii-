<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

class DonorRequest extends FormRequest
{
   
    public function authorize()
    {
        return true;
    }

    
    public function rules()
    {
        return [
            'name'=>'required_without:id|max:25',
            'email'=>'required_without:id|email|unique:donors,email',
            'password'=>'required_without:id|min:8',
            'phone'=>'required_without:id|numeric|min:9',
            'address'=>'required_without:id',
            'work_details'=>'required_without:id',
        ];
    }
}
