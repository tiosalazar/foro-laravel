@extends('adminlte::layouts.app')

@section('htmlheader_title')
{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
<div class="row">
  <!-- <clientes></clientes> -->
  <listar_notificaciones></listar_notificaciones>
</div>



  @endsection