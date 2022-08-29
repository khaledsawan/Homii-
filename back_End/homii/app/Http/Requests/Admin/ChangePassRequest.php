<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

class ChangePassRequest extends FormRequest
{
 
    public function authorize()
    {
        return true;
    }

    
    public function rules()
    {
        return [
            'oldPassword'=>'required|min:8',
            'newPassword'=>'required|min:8',
            'confirmation_password'=>'required|min:8|same:newPassword',
        ];
    }
}
