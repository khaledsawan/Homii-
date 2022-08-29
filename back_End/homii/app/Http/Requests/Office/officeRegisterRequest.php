<?php

namespace App\Http\Requests\Office;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class OFficeRegisterRequest extends FormRequest
{

    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'name' => 'required|min:3',
            'email' => 'required|email|unique:office_registers,email|unique:offices,email',
            'password' => 'required|min:8',
            'address' => 'required|max:50|min:2',
            'mobile' => 'required|min:9|numeric',
            'description' => 'required|string|min:5',
        ];
    }

    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response()->json($validator->errors(), 422));
    }
}
