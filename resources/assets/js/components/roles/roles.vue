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
          <div  role="form"  action="#">
                <div class="form-group required" v-bind:class="[errors_return.name,{ 'has-error': errors.has('name') }]">
                    <label for="nombre_rol">Nombre  <sup>*</sup> </label>
                    <input type="text" v-model="rolarray.name"  class="form-control" name="name" id="nombre_rol" placeholder="Nombre logico del rol" data-vv-as="Nombre Logico" v-validate data-vv-rules="required|alpha_num|min:5" >
                      <span  class="help-block" v-show="errors.has('name')">{{ errors.first('name') }}</span>
                </div>
                <div class="form-group required" v-bind:class="[errors_return.display_name,{ 'has-error': errors.has('display_name') }]">
                    <label for="nombre_rol">Nombre a Mostrar   <sup>*</sup> </label>
                    <input type="text" v-model="rolarray.display_name"  class="form-control" name="display_name" id="display_name_rol" data-vv-as="Nombre a mostrar" placeholder="Nombre del rol"  v-validate data-vv-rules="required|min:5" >
                     <span  class="help-block" v-show="errors.has('display_name')">{{ errors.first('display_name') }}</span>
                </div>
                <div class="form-group required" v-bind:class="[errors_return.description,{ 'has-error': errors.has('description') }]">
                    <label for="nombre_rol">Descripción </label>
                    <textarea v-model="rolarray.description"  class="form-control" name="description" id="description_rol" placeholder="Descripción del rol"  >
                      </textarea>
                        <span  class="help-block" v-show="errors.has('description')">{{ errors.first('description') }}</span>
                </div>
                <div class="form-group">
                   <button class="btn btn-primary" v-on:click="crear_rol()">Guardar</button>
                </div>

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
      components: {VeeValidate,Validator},
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
           this.$validator.validateAll();
            if (this.errors.any()) {
              return false
            }
          var input = this.rolarray;
            this.$http.post('api/v1/roles',input)
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
                  console.log(respuesta)
                  toastr.success(respuesta.body.msg,'',this.option_toast);
                  this.id_rol_passing={'id':respuesta.body.obj.id,'name':respuesta.body.obj.name,'display_name':respuesta.body.obj.display_name,'description':respuesta.body.obj.description};
                  this.rolarray={};
                }
            },(response) => {
                console.log(response);
                console.log('error');
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
