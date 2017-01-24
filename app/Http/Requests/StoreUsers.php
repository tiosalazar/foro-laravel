<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class StoreUsers extends FormRequest
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
                 'nombre' => 'required|min:4|max:45',
                 'apellido' => 'required|min:4|max:45',
                 'cargo' => 'required|min:4|max:45',
                 'email' => 'required|unique:users,email|email|max:115',
                 'horas_disponible' => 'required',
                 'password' => 'required',
                 'roles_id' => 'required',
                 'areas_id' => 'required',
        ];
    }
}
