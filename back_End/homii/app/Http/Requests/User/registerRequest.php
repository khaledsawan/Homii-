<?php

namespace App\Http\Requests\User;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class registerRequest extends FormRequest
{

    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'firstName' => 'required|max:30|min:2',
            'lastName' => 'required|max:30|min:2',
            'email' => 'required|email|unique:registers,email|unique:students,email',
            'password' => 'required|min:8',
            'city' => 'required|string',
            'age' => 'required|numeric',
            'mobile' => 'required|min:9|numeric',
            'gender' => 'required|in:male,female',
            'university_college' => 'required|string',
            'academic_year' => 'required|numeric',
            'university_card' => 'required|mimes:png,jpg,jpeg,tiff|max:5096',
            'description' => 'required|string|min:5',
        ];
    }

    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response()->json($validator->errors(), 422));
    }
}
