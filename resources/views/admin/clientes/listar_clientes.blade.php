@extends('adminlte::layouts.app')

@section('htmlheader_title')
  {{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
<div class="row">
    <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Clientes - Himalaya</h3>

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
              <table class="table table-hover ">
                <tbody><tr>
                  <th>NIT</th>
                  <th>Cliente</th>
                  <th>Nombre de Contacto</th>
                  <th>Correo</th>
                  <th>Teléfono</th>
                  <th></th>
                  <th></th>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td><button type="button" class="btn btn-block btn-warning btn-sm">Editar</button></td>
                  <td><button type="button" class="btn btn-block btn-danger btn-sm">Borrar</button></td>
                </tr>
              </tbody></table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div> 
        <listar_clientes ></listar_clientes>
        
</div>




@endsection