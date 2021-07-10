<?php
namespace App\Http\Requests;
use App\Http\Requests\Request;
use Sentinel;
class AdminUsersEditFormRequest extends Request{
    /**
     * Determine if the user is authorized to make this request.
     * 
     * @return bool
     */
    public function authorize(){
        return true;
    }
    /**
     * Get the validation rules that apply to the request
     * 
     * @return array
     */
    public function rules(){
        return [
            'account_type'=>'integer',
            'email'=>'required|email',
            'first_name'=>'required',
            'last_name'=>'required',
            'password'=>'confirmed|min:5'
        ];
    }
}

