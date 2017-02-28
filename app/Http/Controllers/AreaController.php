<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Area;
use App\User;
use App\Historico_equipo;
use App\Role;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Validator;
use Illuminate\Http\Response;
use Exception;
use Yajra\Datatables\Datatables;
use Carbon\Carbon;

class AreaController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
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

    public function index_areas()
    {
       $area=Area::all()->where('estado','1');
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
        $area["total_horas"]=0;
        $area["coordinador"]='';
        $area["apellido_coordinador"]='';
        $area["email"]='';
        foreach ($area->User as $key => $value) {
            if ($value->estado != 0) {
                $area["total_horas"] += (int)$value['horas_disponible'];
            }
            $value->Rol;
            if ($value->rol->name=='coordinador') {
                $area["coordinador"]=$value->nombre;
                $area["apellido_coordinador"]=$value->apellido;
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
     * Método historico de equipo de trabajo
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
   
    public function historico_de_equipos($id,Request $request)
    {
        
        // Si no trae el mes y año en el $request
        // tomar el mes y el año actual
        $year = '';
        $month = '';
        $now = Carbon::now();
        if ($request->has('year')) {
            $year = $request->get('year');
        }else{
            $year = $now->year;
        }
        if ($request->has('month')) {
            $month = $request->get('month');
        }else{
            $month = $now->month;
        }
        if ($id=='1') {
            $historico_equipo = Historico_equipo::select('users.nombre','historico_equipos.id','historico_equipos.horas_disponibles','historico_equipos.horas_gastadas','historico_equipos.tipo_de_entidad')->join('users','users.id','=','historico_equipos.entidad_id')->where('tipo_de_entidad',$id)
            ->whereYear('historico_equipos.created_at', $year)
            ->whereMonth('historico_equipos.created_at', $month)
            ->get();
             //$historico_equipo=Historico_equipo::with('usuario')->where('tipo_de_entidad',$id)->get();

        } else{
          $historico_equipo = Historico_equipo::select('areas.nombre','historico_equipos.id','historico_equipos.horas_disponibles','historico_equipos.horas_gastadas','historico_equipos.tipo_de_entidad')->join('areas','areas.id','=','historico_equipos.entidad_id')->where('tipo_de_entidad',$id)
            ->whereYear('historico_equipos.created_at', $year)
            ->whereMonth('historico_equipos.created_at', $month)
            ->get();  
        }

        // Retorno la informacion para el datatable
         return Datatables::of($historico_equipo)->make(true);

    }

    /**
     * Traer el primer historico
     **/
    public function getFirstHistorico()
    {
        $historico_equipo = Historico_equipo::orderBy('created_at')->first();
        return $historico_equipo;
    }

     /**
     * Traer años del historico de equipos
     **/
    public function getYearHistorico()
    {
        $years = array();
        $firstHistorico = $this->getFirstHistorico();
        $historico_equipo = Historico_equipo::orderBy('created_at', 'desc')->first();
        if($historico_equipo != null ){
            $lastYear = Carbon::instance($historico_equipo->created_at)->year;
            $firstYear = Carbon::instance($firstHistorico->created_at)->year;
            for ($i=$firstYear; $i <=  $lastYear; $i++) {
                array_push($years, (string)$i);
            }
            return $years;
        }
        return [];
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
