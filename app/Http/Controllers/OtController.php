<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Ot;
use App\Tiempos_x_Area;
use App\Requerimientos_Ot;
use App\Compras_Ot;
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
        $data= $request->all();
        
        $vl=$this->validatorCrearOT($data['datos_encabezado']);
      if ($vl->fails())
         {
                return response()->json($vl->errors());
         }else
             {   
                try
                {
                   //  DB::beginTransaction();
                         $ot=new Ot;
                         $ot->fill($data['datos_encabezado']);
                         $ot->save();

                        $requerimientos=$data['requerimientos'];
                        $compras=$data['compras'];

                         /*Agregar Tiempos por Area Requerimientos */
                         $id_ot=$ot->id;
                         $index=0;
                         foreach ($requerimientos as $requerimiento) {
                         $tiempos_x_area= new Tiempos_x_Area;
                         /*Agrego el tiempo por Area */
                         $tiempos_x_area->tiempo_estimado=$requerimiento['horas'];
                         $tiempos_x_area->ots_id=$id_ot;
                         $tiempos_x_area->areas_id=$requerimiento['area'];
                         $tiempos_x_area->save();
                           /*El siguiente for recorre el listado de requerimientos y los agrega */
                         for ($i=0; $i < count($requerimiento['requerimientos']) ; $i++) {
                            $model_descripcion_requerimiento= new Requerimientos_Ot; 
                            $arreglo=$requerimiento['requerimientos'][$i];
                            $arreglo_ingresar= array('nombre' => $arreglo['model_nom'],'horas'=> $arreglo['model_horas'],'ots_id'=>$id_ot);
                            $model_descripcion_requerimiento->fill( $arreglo_ingresar);
                            $model_descripcion_requerimiento->save();
                         }

                        }
                        /*El siguiente for recorre el listado de compras y los agrega*/
                         foreach ($compras as $compra) {
                                 $model_compras= new Compras_Ot; 
                                 $model_compras->fill($compra);
                                 $model_compras->ots_id=$id_ot;
                                 $model_compras->save();
                          }
                      return response([
                            'status' => Response::HTTP_OK,
                            'response_time' => microtime(true) - LARAVEL_START,
                            'msg' => 'La OT ha sido creada con exito !! ',
                            'obj' => $ot
                        ],Response::HTTP_OK);

                }catch(Exception $e){
                    // DB::rollback();
                    return response([
                        'status' => Response::HTTP_BAD_REQUEST,
                        'response_time' => microtime(true) - LARAVEL_START,
                        'error' => 'fallo_en_la_creacion',
                        'consola' =>$e->getMessage(),
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
       
         $ot=OT::findOrFail($id);
         $data=[];
         $data['datos_encabezado']=$ot;
         $data['compras']=[];
         foreach ($ot->Tiempos_x_Area as  $value) {
            $data['requerimientos']['area']=$value['areas_id'];
            $data['requerimientos']['horas']=$value['tiempo_estimado'];
         }
         foreach ($ot->Requerimiento_Ot as  $value) {
            array_push($data['requerimientos'], $value);
         }
         foreach ($ot->Compras_Ot as  $value) {
               array_push($data['compras'], $value);
         }
         return view('admin.ots.visualizar_ot')->with('arregloOT', json_encode($data));
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
