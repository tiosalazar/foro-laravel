@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
	<section>
	   <ots_graficas></ots_graficas>
	</section>
@endsection
