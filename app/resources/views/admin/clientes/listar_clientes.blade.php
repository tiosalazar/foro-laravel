@extends('adminlte::layouts.app')

@section('htmlheader_title')
{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
<div class="row">
  <!-- <clientes></clientes> -->
  <crear_listar_cliente></crear_listar_cliente>
</div>



  @endsection