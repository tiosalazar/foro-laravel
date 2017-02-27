<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Yajra\Datatables\Datatables;
use Carbon\Carbon;
use App\Historico_equipo;

class HistoricoequipoController extends Controller
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
}
