<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Ot;
use Illuminate\Support\Facades\DB;

use Illuminate\Foundation\Validation\ValidatesRequests;
use Validator;
use Illuminate\Http\Response;
use Exception;

class OtController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $ot= Ot::all();
        $ot= DB::table('ots')
            ->join('clientes', 'ots.clientes_id', '=', 'clientes.id')
            ->join('users', 'ots.usuarios_id', '=', 'users.id')
            ->select('ots.*', 'clientes.nombre as nombre_cli', 'users.nombre as nombre_ej')
            ->get();
      return response()->json($ot);
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
        $vl=$this->validatorCrearOT($request->all());
      if ($vl->fails())
         {
               return response()->json($request->all());
         }else
             {
                    $ot=new Ot;
                    $ot->fill($request->all());
                try
                {
                     $ot->save();
                      return response([
                            'status' => Response::HTTP_OK,
                            'response_time' => microtime(true) - LARAVEL_START,
                            'rol' => $ot
                        ],Response::HTTP_OK);
                }catch(Exception $e){
                    return response([
                        'status' => Response::HTTP_BAD_REQUEST,
                        'response_time' => microtime(true) - LARAVEL_START,
                        'error' => 'fallo_en_la_creacion',
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
        //
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
                    $vl=$this->validatorCrearOT($request->all());
                         if ($vl->fails())
                            {
                               return response()->json($vl->errors());
                            }else
                                {
                                //Busca el usuario en la BD
                                 $ot=  Ot::findOrFail($id);
                                // Si la data es valida se la asignamos al usuario
                                $ot->fill($request->all());
                                // Guardamos el usuario
                                $ot->update();
                               $respuesta["error"]=0;
                               $respuesta["mensaje"]="OK";
                             }
                    }catch(Exception $e){
                       $respuesta["error"]="rol_no_encontrado";
                       $respuesta["codigo_error"]="UC_Update_dontfind";
                       $respuesta["mensaje"]="Rol no encontrado";
                       $respuesta["consola"]=$e;
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

   /*DSO 24-01-2016 Funcion para validar los campos al crear un usuario
    * entra el arreglo de datos
    * Sale un arreglo con los errores.
    */
   protected function validatorCrearOT(array $data)
    {
        return Validator::make($data, [
                'nombre' => 'required|min:4|max:45',
                'referencia' => 'required',
                'valor' => 'required|min:4|max:45',
                'fecha_inicio' => 'required|date',
                'fecha_final' => 'required|date',
                'clientes_id' => 'required',
                'usuarios_id' => 'required',
                'estados_id' => 'required',
        ]);
    }
}
