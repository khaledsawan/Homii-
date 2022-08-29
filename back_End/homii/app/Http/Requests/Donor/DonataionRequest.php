<?php

namespace App\Http\Requests\Donor;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class DonataionRequest extends FormRequest
{
   
    public function authorize()
    {
        return true;
    }

    
    public function rules()
    {
        return [
            'balance' => 'required|numeric',
        ];
    }

    public function failedValidation(Validator $validator){
        throw new HttpResponseException(response()->json($validator->errors(),422));
    }
}
