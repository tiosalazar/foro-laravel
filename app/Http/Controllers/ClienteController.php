<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Cliente;
use App\Historico_cliente;
use Validator;
use Illuminate\Http\Response;
use Exception;
use Yajra\Datatables\Datatables;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
class ClienteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      // $clientes = Cliente::all();
      $clientes = Cliente::with(['usuario' => function ($query){

     $query->addselect('*');
     $query->addselect(DB::raw('CONCAT(nombre," ",apellido) as full_name'));

   }])->where('estado', 1)->get();
      // return response()->json($clientes);
      return Datatables::of($clientes)
      ->addColumn('action', function($cliente) {
        $editar_cliente=(Auth::user()->hasRole('owner') || Auth::user()->hasRole('desarrollo')|| Auth::user()->can('editar_clientes'))?'<a href="editar/'.$cliente->id.'" class="btn btn-primary btn-xs btn-flat btn-block usuario_edit">Editar</a>':'';
        $borrar_cliente=(Auth::user()->hasRole('owner') || Auth::user()->hasRole('desarrollo')|| Auth::user()->can('borrar_clientes'))?'<button type="button" id="cli-'.$cliente->id.'" class="btn btn-danger btn-xs btn-flat btn-block delete_cliente" data-toggle="modal" data-target="#myModal">Borrar</button>':'';
        return $editar_cliente.$borrar_cliente;
      })
      ->addColumn('ejecutivo', function($cliente) {
        return ($cliente->usuario != null)?$cliente->usuario->full_name:'No definido';
      })
      ->make(true);

    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function select_clientes()
    {
      // $clientes = Cliente::all();
      $clientes = Cliente::where('estado', 1)->orderBy('nombre', 'ASC')->get();
      return response()->json($clientes);
    }
    /*public function index()
    {
        $clientes = Cliente::all();

        return view('listar_clientes', ['clientes' => $clientes]);
    }*/

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $cliente = new Cliente;
        $cliente->create($request->all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $cliente = new Cliente;
        $historico_cliente = new Historico_cliente;
        $cliente->fill($request->all());
        $historico_cliente->fill($request->all());
        //Validación de las entradas por el metodo POST
        $vl=$this->validatorCrearCliente($request->all());
        if ($vl->fails()){
            // return response()->json($vl->errors());
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'msg' => 'Error al crear el cliente',
                'error' => 'ERR_01',
                'obj' =>$vl->errors()
                ],Response::HTTP_BAD_REQUEST);
        }else{
            try {
                $cliente->save();
                $historico_cliente->cliente_id = $cliente->id;
                $historico_cliente->save();
                return response([
                    'status' => Response::HTTP_OK,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'obj' => $cliente,
                    'error' => null,
                    'msg' => 'Cliente creado con exito',
                    ],Response::HTTP_OK);
            } catch (Exception $e) {
               return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'error' => 'ERR_04',
                'msg' => 'excepcion, fallo la petición',
                'consola' =>$e->getMessage(),
                'obj' => $request->all()
                ],Response::HTTP_BAD_REQUEST);
           }
       }
        /*$cliente = new Cliente;
        $cliente->name = $request->name;
        $cliente->description = $request->description;
        $cliente->save();*/
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user= Cliente::findOrFail($id);
        return response()->json($user);
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
        try {
            //Validación de las entradas por el metodo POST
            $vl=$this->validatorCrearCliente($request->all());
            if ($vl->fails()){
                return response([
                    'status' => Response::HTTP_BAD_REQUEST,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'msg' => 'Error al actualizar el cliente',
                    'error' => 'ERR_02',
                    'obj' =>$vl->errors()
                ],Response::HTTP_BAD_REQUEST);
            }else{
                //Busca el cliente en la BD
                $cliente=  Cliente::findOrFail($id);
                $historico_cliente = new Historico_cliente;
                // Si la data es valida se la asignamos al cliente
                $cliente->fill($request->all());
                $historico_cliente->fill($request->all());
                // Actualizamos el cliente
                $cliente->save();
                $historico_cliente->cliente_id = $cliente->id;
                $historico_cliente->save();
                return response([
                        'status' => Response::HTTP_OK,
                        'response_time' => microtime(true) - LARAVEL_START,
                        'obj' => $cliente,
                        'error' => null,
                        'msg' => 'Cliente actualizado con éxito',
                    ],Response::HTTP_OK);
            }
        }catch(Exception $e){
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'error' => 'ERR_04',
                'msg' => 'excepcion, fallo la petición',
                'consola' =>$e->getMessage(),
                'obj' => $request->all()
                ],Response::HTTP_BAD_REQUEST);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $vl= Validator::make(['id'=>$id], ['id' => 'required|integer']);

        try {
            //Busca el cliente en la BD
            $cliente=  Cliente::findOrFail($id);
            if ($vl->fails()) {
                return response([
                    'status' => Response::HTTP_BAD_REQUEST,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'msg' => 'Error al eliminar el cliente',
                    'error' => 'ERR_03',
                    'obj' =>$vl->errors()
                ],Response::HTTP_BAD_REQUEST);
            } else {
                $cliente->estado = 0;
                $cliente->save();
                $historico_cliente = new Historico_cliente;
                $historico_cliente->fill($cliente->toArray());
                $historico_cliente->cliente_id = $cliente->id;
                $historico_cliente->save();
                return response([
                            'status' => Response::HTTP_OK,
                            'response_time' => microtime(true) - LARAVEL_START,
                            'obj' => $cliente,
                            'error' => null,
                            'msg' => 'Cliente borrado con éxito',
                        ],Response::HTTP_OK);
            }



        } catch (Exception $e) {
            return response([
                    'status' => Response::HTTP_BAD_REQUEST,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'error' => 'ERR_04',
                    'obj' => 0,
                    'msg' => 'excepcion, fallo la petición',
                    'consola' =>$e->getMessage(),
                ],Response::HTTP_BAD_REQUEST);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function getCliente($id)
    {
        $cliente= Cliente::findOrFail($id);
        // return response()->json($cliente);
        return view('admin.clientes.editar_cliente')->with('cliente',$cliente);
    }
    /**
     * Listar los historicos de clientes en Datatable
     * @param  Request $request [description]
     * @return [type]           [description]
     */
    public function historico_de_clientes(Request $request)
    {
        $output= array();
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
        $clientes = Historico_cliente::with(['usuario' => function ($query){

           $query->addselect('*');
           $query->addselect(DB::raw('CONCAT(nombre," ",apellido) as full_name'));

         }])
        ->whereYear('created_at', $year)
        ->whereMonth('created_at', $month)
        ->get();

        return Datatables::of($clientes)
        ->editColumn('created_at', function ($tarea) {
            return $tarea->getFormatFecha($tarea->created_at);
        })
        ->addColumn('action', function($cliente) {
          return (Auth::user()->hasRole('owner') || Auth::user()->hasRole('desarrollo'))?'<a href="editar/'.$cliente->id.'" class="btn btn-primary btn-xs btn-flat btn-block usuario_edit">Editar</a><button type="button" id="cli-'.$cliente->id.'" class="btn btn-danger btn-xs btn-flat btn-block delete_cliente" data-toggle="modal" data-target="#myModal">Borrar</button>':'';
        })
        ->addColumn('ejecutivo', function($cliente) {
          return ($cliente->usuario != null)?$cliente->usuario->full_name:'No definido';
        })
        ->make(true);

        }

    /**
     * Traer el primer historico
     **/
    public function getFirstHistorico()
    {
        $historico_cliente = Historico_cliente::orderBy('created_at')->first();
        return $historico_equipo;
    }

     /**
     * Traer años del historico de equipos
     **/
    public function getYearHistorico()
    {
        $years = array();
        $firstHistorico = $this->getFirstHistorico();
        $historico_cliente = Historico_cliente::orderBy('created_at', 'desc')->first();
        if($historico_cliente != null ){
            $lastYear = Carbon::instance($historico_cliente->created_at)->year;
            $firstYear = Carbon::instance($firstHistorico->created_at)->year;
            for ($i=$firstYear; $i <=  $lastYear; $i++) {
                array_push($years, (string)$i);
            }
            return $years;
        }
        return [];
    }


    /**
    *
    *
    **/
    protected function validatorCrearCliente(array $data)
    {
        return Validator::make($data, [
            'nombre' => 'required|min:4',
            'nit' => 'required|min:4|max:45',
            // 'telefono' => 'min:4|max:45',
            // 'email' => 'email|max:155',
            'nombre_contacto' => 'min:4|max:45',
        ]);
    }
}
