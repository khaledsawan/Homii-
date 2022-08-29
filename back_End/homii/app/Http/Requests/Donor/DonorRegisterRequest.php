<?php

namespace App\Http\Requests\Donor;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class DonorRegisterRequest extends FormRequest
{
 
    public function authorize()
    {
        return true;
    }

    
    public function rules()
    {
        return [
                'name' => 'required|max:40',
                'email' => 'required|email|unique:donors,email',
                'password' => 'required|min:8',
                'address'=> 'required|string', 
                'phone' => 'required|min:9|numeric',
                'work_details'=>'required'
    
            ];
        }
        
        public function failedValidation(Validator $validator){
            throw new HttpResponseException(response()->json($validator->errors(),422));
        }
}
