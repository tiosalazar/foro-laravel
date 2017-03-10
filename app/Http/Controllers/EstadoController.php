<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Estado;
use App\Rol;
use App\User;
use Illuminate\Support\Facades\Auth;

class EstadoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        /**
         *  1      = Estados correspondientes al Rol
         *  2      = Todos los estados de Ot menos Terminado (10)
         *  otro   = Traer todos los estaddos correspondientes al ID 
         */
        switch ($id) {
            case '1':
                $rol = Auth::user()->rol;
                $estados = $rol->estados;
                break;
            case '2':
                $estados= Estado::where('tipos_estados_id',$id)->where('id','!=','10')->get();
                break;
            
            default:
                $estados= Estado::where('tipos_estados_id',$id)->get();
                break;
        }
     
      return response()->json($estados);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
