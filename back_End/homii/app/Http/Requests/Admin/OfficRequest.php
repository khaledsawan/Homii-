<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

class OfficRequest extends FormRequest
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

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required|min:3|unique:offices,name',
            'mobile'=>'required|min:9',
            'email'=>'required|email|unique:users,email',
            'password'=>'required|min:8',
            'address'=>'required|string|min:3',
            'description'=>'sometimes',
        ];
    }

    public function messages()
    {
        return [
            'required'=>'هذا الحقل مطلوب'
        ];
    }
}
