@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
	
	 <div class="container">
        <div class="row">
        <div class="titulos_foro">
			<h3 class="box-title"><span class="span_descripcion1">Editar</span> <span class="span_descripcion2"> Usuario</span></h3>
		 </div>
            <div class="col-md-12 "> 
             <form_usuarios titulor="Editar Usuario" comando="2" edituserdata="{{$usuarioslist}}"></form_usuarios>
            </div>
        </div>
    </div>
@endsection
