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

                  <td class="col-md-9"><button class="btn btn-warning btn-xs" data-toggle="modal" data-target="#myModal_area" @click="pasardatosmodalarea(list_area.id,list_area.nombre,list_area.extencion_tel,list_area.estado)">Editar</button></td>
                  
                </tr>
                <tr>
              
              </tbody></table>
            </div>
            <!-- /.box-body -->
          </div>

           <!-- Ventana modal para Editar -->
              <div class="example-modal">
                <div class="modal fade" id="myModal_area">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">Edición de Área</h4>
                      </div>
                      <div class="modal-body">
                        <label for="id_area_edit">ID</label>
                        <input type="text" class="form-control" id="id_area_edit" v-model="areaedit.id_area_edit" disabled>

                        <label for="nombre_area_edit">Editar nombre del área</label>
                        <input type="text" class="form-control" id="nombre_area_edit" v-model="areaedit.nombre" placeholder="Editar nombre">

                        <label for="area_ext_edit">Editar extención</label>
                        <input type="text" class="form-control" id="area_ext_edit" v-model="areaedit.extencion" placeholder="Editar extención">
                        
                         <label for="estado_area" >Estado</label>
                        <select name="" id="estado_area" v-model="areaedit.estado" class="form-control">
                          <option value="1">Activo</option>
                          <option value="0">Inactivo</option>
                        </select>

                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary " id="save_edit_rol" @click="updatearea" data-dismiss="modal">Guardar</button>
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
          list_areas:[],
          areaedit:[]
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
                this.list_areas=respuesta.body;
              });
          },
           pasardatosmodalarea:function(id,nombre,ext,estado){

            
            this.areaedit.push(this.areaedit.id_area_edit=id);
            this.areaedit.push(this.areaedit.nombre=nombre);
             this.areaedit.push(this.areaedit.extencion=ext);
            this.areaedit.push(this.areaedit.estado=estado);

          }, 
           updatearea:function(){

            var idmodal=this.areaedit.id_area_edit;
            var nombremodal=this.areaedit.nombre;
            var extmodal=this.areaedit.extencion;
            var estadomodal=this.areaedit.estado;
 
            this.$http.put('api/v1/areas/'+idmodal+'',{nombre: nombremodal, extencion_tel:extmodal,estado:estadomodal})
            .then(function(respuesta){
               console.log(respuesta);
                for (var i = 0; i < this.list_areas.length; i++) { 
                   if (this.list_areas[i].id==respuesta.body.id) {
                       this.list_areas[i].nombre=respuesta.body.datos.nombre;
                       this.list_areas[i].extencion_tel=respuesta.body.datos.extencion_tel;
                       this.list_areas[i].estado=respuesta.body.datos.estado;
                  }
                }
    
            });
            
          }

     }

  }

</script>
