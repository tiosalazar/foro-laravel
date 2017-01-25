@extends('adminlte::layouts.app')

@section('htmlheader_title')
  {{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
<div class="row">
<section class="col-md-12">
  <!-- <div class="row"> -->
    <div class="box box-default collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">Agregar Cliente</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
          </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <crear_cliente_form></crear_cliente_form>
        </div>
        <!-- /.box-body -->
      </div>
  <!-- </div> -->
  <!-- ./ row -->
</section>
    <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Clientes</h3>

              <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                  <div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <listar_clientes ></listar_clientes>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div> 
        
</div>




@endsection