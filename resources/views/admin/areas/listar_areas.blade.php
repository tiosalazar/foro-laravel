@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
	<h3>Listar areas</h3>
	<listado_areas></listado_areas>
@endsection
