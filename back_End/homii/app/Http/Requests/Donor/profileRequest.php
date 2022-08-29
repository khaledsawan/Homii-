<?php

namespace App\Http\Requests\Donor;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class profileRequest extends FormRequest
{
    
    public function authorize()
    {
        return true;
    }


    public function rules()
    {
        return [
            'name' => 'required_without:_method',
            'address' => 'required_without:_method',
            'phone' => 'required_without:_method|numeric',
            'work_details' => 'required_without:_method',
        ];
    }

    public function failedValidation(Validator $validator){
        throw new HttpResponseException(response()->json($validator->errors(),422));
    }
}
