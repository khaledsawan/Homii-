<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

class StudentRequest extends FormRequest
{
   
    public function authorize()
    {
        return true;
    }


    public function rules()
    {
        return [
            'firstName'=>'required|max:15',
            'lastName'=>'required|max:15',
            'mobile'=>'required|min:9',
            'email'=>'required_without:id|email|unique:users,email',
            'age'=>'required|lte:30|numeric',
            'city'=>'required|max:25',
            'university_college'=>'required',
            'academic_year'=>'required|numeric',
            'password'=>'required_without:id|min:8',
            'gender'=>'required'
        ];
    }
}
