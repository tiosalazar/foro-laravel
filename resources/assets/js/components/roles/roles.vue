<template id="rol_list">
   <div> 
      <div class="box box-default collapsed-box" id="main-app">

        <div class="box-header with-border">
            <h3 class="box-title">Crear nuevo rol</h3>

            <div class="box-tools pull-right">
              <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
           </div>

        </div>
    
      <div class="box-body">
          <div  role="form" class="form-inline" action="#">
                <div class="form-group" v-bind:class="[errors_return.nombre,{ 'has-error': errors.has('nombre') }]">
                    <label for="nombre_rol">Nombre</label>
                    <input type="text" v-model="rolarray.nombre"  class="form-control" name="nombre" id="nombre_rol" placeholder="Nombre del rol"  v-validate data-vv-rules="required|alpha_num|min:5" >
                   
                </div>

                <div class="form-group">
                   <button class="btn btn-primary" v-on:click="crear_rol()">Guardar</button>
                </div> 
                <span  class="has-error" v-show="errors.has('nombre')">{{ errors.first('nombre') }}</span> 

            </div>
                
                         
      </div>
      
    </div>
   
      <listar-roles  :id_parent="id_rol_passing" ></listar-roles>
   
    </div>
    
</template>

<style>
  .fade-enter-active, .fade-leave-active {
    transition: opacity .5s
  }
  .fade-enter, .fade-leave-to /* .fade-leave-active in <2.1.8 */ {
    opacity: 0
  }
</style>

<script>

import VeeValidate, { Validator } from 'vee-validate';

  Vue.use(VeeValidate);

      Vue.component(
        'listar-roles',
        require('./listar_roles.vue')
      );

  
   module.exports= {
 
       data(){
        return{
          rolarray: {},
          id_rol_passing:{},
           message :'',
          errors_return:{
            'nombre':''
          },
           option_toast:{
            timeOut: 5000,
            "positionClass": "toast-top-center",
            "closeButton": true
          }        
        }
        
       },     
        methods:{      
         setErrors:function(object) {
          this.message='';
          var that = this;
          $.each(object, function(index, value) {
            that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
            that.errors_return[index] = 'has-warning';
          });
        },    
          crear_rol: function(e){            
          var input = this.rolarray;            
            this.$http.post('api/v1/roles',input)
            .then(function(respuesta){ 
                if (respuesta.status != '200') {
                  if (Object.keys(respuesta.body.rol).length>0) {
                    this.setErrors(respuesta.body.rol);
                  }
                  toastr.warning(this.message,respuesta.body.msg,this.option_toast);
                }else{
                  toastr.success(respuesta.body.msg,'',this.option_toast);
                  this.id_rol_passing={'id':respuesta.body.rol.id,'nombre':respuesta.body.rol.nombre}; 
                }           
            },(response) => {
                
                console.log(response);
                toastr.error(this.message,response.body.error,this.option_toast);
              });
          },
          prueba:function(){
            alert("aqaaa");
          }
        }

    }

      
    
</script>
