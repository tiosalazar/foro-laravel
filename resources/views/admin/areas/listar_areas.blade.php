@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
	<listado_areas administrador="{{Auth::user()->can('editar_usuarios') }}"></listado_areas>
@endsection
