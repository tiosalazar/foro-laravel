@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
	
	 <div class="">
        <div class="row">
            <div class="col-md-12 "> 

             <form_usuarios titulor="Crear Usuario" comando="1" ></form_usuarios>
            </div>
        </div>
    </div>
@endsection
