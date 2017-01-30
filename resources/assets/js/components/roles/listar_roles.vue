
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
                  <th class="col-md-2">Nombre</th>
                  <th class="col-md-9">Edicion</th>                
                </tr>
                
                  <tr v-for="listrol in listroles" >
                   
                      <td class="col-md-2">{{listrol.nombre}}</td>
                      <td class="col-md-9"><button class="btn btn-warning btn-xs edicion_rol" data-toggle="modal" data-target="#myModal_rol" :id_rol="listrol.id" @click="pasardatosmodal(listrol.id,listrol.nombre)">Editar</button></td>
                  
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
                        <h4 class="modal-title">Edición de Rol</h4>
                      </div>
                      <div class="modal-body">
                        <label for="id_rol_edit">ID</label>
                        <input type="text" class="form-control" id="id_rol_edit" v-model="id_rol_edit" disabled>
                        <label for="nombre_rol_edit">Editar nombre del rol</label>
                        <input type="text" class="form-control" id="nombre_rol_edit" v-model="nombre_rol_edit.nombre" placeholder="Nuevo nombre">
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary " id="save_edit_rol" @click="updaterol" data-dismiss="modal">Guardar</button>
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



   module.exports= {

  
       props: ['rolname','id_parent'],

       created: function(){
          this.consumerApi_listRol();    
       },
       data(){
          return{
            listroles:[],
            id_rol_edit:[],
            nombre_rol_edit:[],
            option_toast:{
              timeOut: 5000,
              "positionClass": "toast-top-center",
              "closeButton": true
            } 
         
          }
          
       },
          watch : {
            id_parent : function (value) {
              this.listroles.push(value);
            }
          },
        methods:{
          consumerApi_listRol: function(){
            this.$http.get('api/v1/roles')
              .then(function(respuesta){
                this.listroles=respuesta.body;
              });
          }, 
          pasardatosmodal:function(id,nombre){
            console.log(id);
            this.id_rol_edit=id;
            this.nombre_rol_edit.nombre=nombre;
          }, 
          updaterol:function(){

            var idmodal=this.id_rol_edit;
            var nombremodal=this.nombre_rol_edit.nombre;
            
            console.log(nombremodal);
            this.$http.put('api/v1/roles/'+idmodal+'',{nombre: nombremodal})
            .then(function(respuesta){

               if (respuesta.status != '200') {
                  if (Object.keys(respuesta.body.rol).length>0) {
                    this.setErrors(respuesta.body.rol);
                  }
                  console.log(respuesta);
                  toastr.warning(this.message,respuesta.body.msg,this.option_toast);
                }else{
                  
                  //Cambion el front con los datos editados
                   for (var i = 0; i < this.listroles.length; i++) { 
                      if (this.listroles[i].id==respuesta.body.id) {
                         this.listroles[i].nombre=respuesta.body.nombre.nombre;
                      }
                    }
                    console.log(respuesta);
                    if (respuesta.body.error == 0) {
                      toastr.success(respuesta.body.msg,'',this.option_toast);
                    }else{
                      toastr.error(respuesta.body.msg,'',this.option_toast);
                    }
                    
                }

            },(response) => {
              console.log(response);
              toastr.error(this.message,response.body.error,this.option_toast);
            });
            
          }         

        }


    }
</script>

