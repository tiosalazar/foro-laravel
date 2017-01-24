<template>

<div>
  		<div class="box">
            <div class="box-header">
              <h3 class="box-title">Listado de Roles</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <table class="table table-striped" >
                <tbody>
                <tr>
                  <th style="width: 10px" class="col-md-1">ID</th>
                  <th class="col-md-2">Nombre</th>
                  <th class="col-md-9">Edicion</th>                
                </tr>
                <tr>
                  <td class="col-md-1">1.</td>
                  <td class="col-md-2">Update software</td>
                  <td class="col-md-9"><button class="btn btn-warning btn-xs" data-toggle="modal" data-target="#myModal_rol">Editar</button></td>
                </tr>
                <tr>
                  <td>2.</td>
                  <td>Clean database</td>
                  <td><button class="btn btn-warning btn-xs" data-toggle="modal" data-target="#myModal_rol">Editar</button></td>
                </tr>
              </tbody></table>
            </div>
            <!-- /.box-body -->
          </div>


          <!-- Ventana modal para Editar -->
              <div class="example-modal">
                <div class="modal fade" id="myModal_rol">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">Default Modal</h4>
                      </div>
                      <div class="modal-body">
                        <p>One fine body…</p>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                      </div>
                    </div>
                    <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->


  </div>
</template>

