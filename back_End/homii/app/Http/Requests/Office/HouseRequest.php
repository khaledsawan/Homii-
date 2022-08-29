<?php

namespace App\Http\Requests\OFfice;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class HouseRequest extends FormRequest
{
    
    public function authorize()
    {
        return true;
    }

 
    public function rules()
    {
        return [
            'address'=>'required_without:_method|min:5',
            'number_students'=>'numeric',
            'number_room'=>'required_without:_method|numeric|lt:7',
            'description'=>'required_without:_method',
            'price'=>'required_without:_method|numeric',
        ];
    }

    public function failedValidation(Validator $validator){
        throw new HttpResponseException(response()->json($validator->errors(),422));
    }
}
