<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Area;
use App\User;
use App\Role;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Validator;
use Illuminate\Http\Response;
use Exception;

class AreaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       $area=Area::all();
      return response()->json($area);
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
         $respuesta=[];
       //Validaciòn de las entradas por el metodo POST
        $vl=$this->validatorCrearArea($request->all());
      if ($vl->fails())
         {
               return response()->json($vl->errors());        
         }else
             {        
                    $area= new Area;  
                    $area->fill($request->all());
                try 
                {
                     $area->save();
                      return response([
                            'status' => Response::HTTP_OK,
                            'response_time' => microtime(true) - LARAVEL_START,
                            'area' => $area,
                            'msg' => 'Área creada con éxito'
                        ],Response::HTTP_OK);
                }catch(Exception $e){
                    return response([
                        'status' => Response::HTTP_BAD_REQUEST,
                        'response_time' => microtime(true) - LARAVEL_START,
                        'error' => 'Fallo al crear el área',
                        'consola' =>$e,
                        'request' => $request->all()
                    ],Response::HTTP_BAD_REQUEST);
               }
         }   
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $area = Area::findOrFail($id);
        $area["total_horas"]='';
        $area["coordinador"]='';
        $area["email"]='';
        foreach ($area->User as $key => $value) {
            $area["total_horas"] += $value['horas_disponible'];
            $value->Rol;
            if ($value->rol->name=='coordinador') {
                $area["coordinador"]=$value->nombre;
                $area["email"]=$value->email;
            }

        }

        return response()->json($area);
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
        $respuesta=[];
                    try 
                    {       
                    //Validaciòn de las entradas por el metodo POST
                    $vl=$this->validatorCrearArea($request->all());
                         if ($vl->fails())
                            {
                               return response()->json($vl->errors());        
                            }else
                                {
                                //Busca el usuario en la BD
                                 $area=  Area::findOrFail($id);
                                // Si la data es valida se la asignamos al usuario
                                $area->fill($request->all());
                                // Guardamos el usuario
                                $area->update();
                               $respuesta["error"]=0;
                               //BC:  30/01/2017 Retorno la respuesta para actualizar la lista en el front
                               $respuesta["mensaje"]="OK"; 
                               $respuesta["id"]=$id;
                               $respuesta["msg"]='Área editada con éxito';
                               $respuesta["datos"]=$request->all();                       
                             }
                    }catch(Exception $e){
                       $respuesta["error"]="Error Editando el área";
                       $respuesta["codigo_error"]="UC_Update_dontfind";
                       $respuesta["mensaje"]="Area no encontrada";
                       $respuesta["consola"]=$e;
                       $respuesta["msg"]='Error Editando el área';
                       $respuesta["request"]=$request->all();
                   }
        return response()->json($respuesta);
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
    /*DSO 24-01-2016 Funcion para validar los campos al ingreso de un usuario 
    * entra el arreglo de datos
    * Sale un arreglo con los errores.
    */   
   protected function validatorCrearArea(array $data)
    {
        return Validator::make($data, [
            'nombre' => 'required|min:4',
            'extencion_tel' => 'required',
            'estado'=> 'required',
        ]);
    }
}
