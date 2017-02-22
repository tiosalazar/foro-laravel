
<template>

<div>
  		<div class="box box-primary">

            <div class="box-header">
              <h3 class="box-title">Listado de Roles</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <table class="table table-striped" >
                <tbody>
                <tr>
                  <th class="col-md-3">Nombre lógico</th>
                  <th class="col-md-3">Nombre a Mostrar</th>
                  <th class="col-md-3">Descripción</th>
                  <th class="col-md-3 text-center">Edicion</th>
                </tr>

                  <tr v-for="listrol in listroles" >
                      <td class="col-md-3">{{listrol.name}}</td>
                      <td class="col-md-3">{{listrol.display_name}}</td>
                      <td class="col-md-3">{{listrol.description}}</td>
                      <td class="col-md-5 text-center"><button class="btn  btn-warning btn-xs edicion_rol" data-toggle="modal" data-target="#myModal_rol" :id_rol="listrol.id" @click="pasardatosmodal(listrol.id,listrol.name,listrol.display_name,listrol.description)">Editar</button></td>

                  </tr>


              </tbody></table>
            </div>
            <!-- /.box-body -->
          </div>


          <!-- Ventana modal para Editar -->
              <div class="example-modal">
                <div class="modal fade" id="myModal_rol">
                  <div class="modal-dialog">
                   <form action="">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">Editar Rol {{nombre_rol_edit.display_name}}</h4>
                      </div>
                      <div class="modal-body">
                          <div class="form-group">
                        <label for="id_rol_edit">ID</label>
                        <input type="text" class="form-control" id="id_rol_edit" v-model="id_rol_edit" disabled>
                          </div>
                        <div class="form-group required" v-bind:class="[errors_return.Nombre,{ 'has-error': errors.has('Nombre') }]">
                        <label for="nombre_rol_edit">Editar nombre del rol <sup>*</sup></label>
                        <input type="text" class="form-control" id="nombre_rol_edit" name="Nombre" v-model="nombre_rol_edit.display_name" placeholder="Nuevo nombre" v-validate data-vv-rules="required|alpha_num_spaces|min:3">
                          <span  class="help-block" v-show="errors.has('Nombre')">{{ errors.first('Nombre') }}</span>
                        </div>

                        <div class="form-group required" v-bind:class="[errors_return.description,{ 'has-error': errors.has('description') }]">
                            <label for="nombre_rol">Descripción </label>
                            <textarea v-model="nombre_rol_edit.description" class="form-control" name="description" id="description_rol" placeholder="Descripción del rol"  >
                              </textarea>
                                <span  class="help-block" v-show="errors.has('description')">{{ errors.first('description') }}</span>
                      </div>
                      </div>

                      <div class="modal-footer">
                        <button type="submit" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary " id="save_edit_rol" @click="updaterol" >Guardar</button>
                      </div>
                    </div>
                    </form>
                    <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
             </div>
</template>

<script>


import VeeValidate, { Validator } from 'vee-validate';

  Vue.use(VeeValidate);

   module.exports= {

       components: {VeeValidate,Validator},
       props: ['rolname','id_parent'],

       created: function(){
          this.consumerApi_listRol();
       },
       data(){
          return{
            listroles:[],
            id_rol_edit:[],
            nombre_rol_edit:{
              display_name:'',
            },
            option_toast:{
              timeOut: 5000,
              "positionClass": "toast-top-center",
              "closeButton": true
            },
            errors_return:{
            'nombre':''
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
            this.$http.get(window._apiURL+'roles')
              .then(function(respuesta){
                this.listroles=respuesta.body;
              });
          },
          pasardatosmodal:function(id,name,display_name,description){

            this.id_rol_edit=id;
            this.nombre_rol_edit.name=name;
            this.nombre_rol_edit.display_name=display_name;
            this.nombre_rol_edit.description=description;
          },
          updaterol:function(){

              this.$validator.validateAll();
              if (this.errors.any()) {
                return false
              }


            var idmodal=this.id_rol_edit;
            var nombremodal=this.nombre_rol_edit.nombre;
            var display_namemodal=this.nombre_rol_edit.display_name;
            var descriptionmodal=this.nombre_rol_edit.description;


            this.$http.put(window._apiURL+'roles/'+idmodal+'',{display_name:  display_namemodal,description: descriptionmodal})
            .then(function(respuesta){

                var that = this;
                that.message ='';
               if (respuesta.status != '200') {
                  if (Object.keys(respuesta.body.request).length>0) {

                    $.each(respuesta.body.request, function(index, value) {
                      that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
                      that.errors_return[index] = 'has-warning';
                    });
                  }

                  toastr.warning(that.message,respuesta.body.msg,this.option_toast);
                }else{

                  //Cambion el front con los datos editados
                   for (var i = 0; i < this.listroles.length; i++) {
                      if (this.listroles[i].id==respuesta.body.id) {
                        console.log(respuesta.body);
                         //this.listroles[i].name=respuesta.body.name.name;
                         this.listroles[i].display_name=respuesta.body.nombre.display_name;
                         this.listroles[i].description=respuesta.body.nombre.description;
                      }
                    }
                    console.log(respuesta);
                    if (respuesta.body.error == 0) {
                      toastr.success(respuesta.body.msg,'',this.option_toast);
                      $('#myModal_rol').modal().hide();
                    }else{
                      console.log('pruena')
                      toastr.error(respuesta.body.nombre,'',this.option_toast);
                    }

                }

            },(response) => {
              console.log(response);
                var that = this;
                that.message = '';
                if (Object.keys(response.body.request).length>0) {
                  $.each(response.body.request, function(index, value) {
                    that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
                    that.errors_return[index] = 'has-error';
                    });
                }
              toastr.error(that.message,response.body.msg,this.option_toast);
            });

          }

        }


    }
</script>
