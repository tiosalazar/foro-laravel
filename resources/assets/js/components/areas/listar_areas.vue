<template>
  <div>

      <div class="box">
            <div class="box-header">
              <h3 class="box-title">Listado de áreas</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <table class="table table-striped table-hover" >
                <tbody>
                <tr>
                  <th style="width: 10px" class="col-md-1">ID</th>
                  <th class="col-md-2">Nombre</th>
                  <th class="col-md-9">Extencion</th>
                  <th class="col-md-9">Estado</th>
                  <th class="col-md-9">Editar</th>
                  <th class="col-md-9">Deshabilitar</th>                  
                </tr>
                <tr v-for="list_area in list_areas">
                  <td class="col-md-1">{{list_area.id}}</td>
                  <td class="col-md-2">{{list_area.nombre}}</td>
                  <td class="col-md-2">{{list_area.extencion_tel}}</td>
                  <td class="col-md-2" v-if="list_area.estado == '1'">
                  Activo
                  </td>
                  <td v-else class="danger">
                    Inactivo
                  </td>

                  <td class="col-md-9"><button class="btn btn-warning btn-xs" data-toggle="modal" data-target="#myModal">Editar</button></td>
                  <td class="col-md-9"><button class="btn btn-danger btn-xs">Cambiar estado</button></td>
                </tr>
                <tr>
              
              </tbody></table>
            </div>
            <!-- /.box-body -->
          </div>

           <!-- Ventana modal para Editar -->
              <div class="example-modal">
                <div class="modal fade" id="myModal">
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


<script>

  module.exports={
    props:['id_parent_area'],
     created: function(){
      this.list_areas_api();    
     },

     data(){
        return{
          list_areas:[]
        }
     },
      watch : {
        id_parent_area : function (value) {
          this.list_areas.push(value);
        }
      },
     methods:{
        list_areas_api: function(){
            this.$http.get('api/v1/areas')
              .then(function(respuesta){
                // console.log(respuesta.body);
                this.list_areas=respuesta.body;
              });
          }
     }

  }

</script>
