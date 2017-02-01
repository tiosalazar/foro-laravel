<template >
      <div class="box box-primary" id="crear_user">
        <div class="box-header">
            <h3>{{titulo}}</h3>
          
        </div>
        
        <div class="box-body">
            <form  role="form">
                <div class="form-group" v-bind:class="[errors_return.nombre,{ 'has-error': errors.has('nombre') }]">
                    <label for="nombre_usuario">Nombre</label>
                    <input type="text" class="form-control" id="nombre_usuario" name="nombre" v-model="usuarios.nombre" placeholder="Nombre" v-validate data-vv-rules="required|alpha_num|max:50">
                    <span  class="has-error error_absolute" v-show="errors.has('nombre')">{{ errors.first('nombre') }}</span>
                </div>
                <div class="form-group" v-bind:class="[errors_return.appelido,{ 'has-error': errors.has('appelido') }]">
                    <label for="apellidos_usuario">Apellidos</label>
                    <input type="text" class="form-control" id="apellidos_usuario" name="apellido"  v-model="usuarios.apellido" placeholder="Apellidos" v-validate data-vv-rules="required|alpha_num|max:50">
                    <span  class="has-error error_absolute" v-show="errors.has('apellido')">{{ errors.first('apellido') }}</span>
                </div>
                <div class="form-group" v-bind:class="[errors_return.email,{ 'has-error': errors.has('email') }]">
                    <label for="email_usuario">Email</label>
                    <input type="email" class="form-control" id="email_usuario"  name="email" v-model="usuarios.email" placeholder="Email" v-validate data-vv-rules="required|email">
                     <span  class="has-error error_absolute" v-show="errors.has('email')">{{ errors.first('email') }}</span>
                </div>
                 <div class="form-group" v-bind:class="[errors_return.password,{ 'has-error': errors.has('password') }]">
                    <label for="contrasena_usuario">Contraseña</label>
                    <input type="text" class="form-control" id="contrasena_usuario" name="password" v-model="usuarios.password"  placeholder="Contraseña" v-validate data-vv-rules="required">
                     <span  class="has-error error_absolute" v-show="errors.has('password')">{{ errors.first('password') }}</span>
                </div>
                 <div class="form-group" v-bind:class="[errors_return.cargo,{ 'has-error': errors.has('cargo') }]">
                    <label for="cargo_usuario">Cargo</label>
                    <input type="text" class="form-control" id="cargo_usuario" name="cargo" v-model="usuarios.cargo"  placeholder="Cargo" v-validate data-vv-rules="required|alpha_num|max:30">
                     <span  class="has-error error_absolute" v-show="errors.has('cargo')">{{ errors.first('cargo') }}</span>
                 </div>
                 <div class="form-group" v-bind:class="[errors_return.telefono,{ 'has-error': errors.has('telefono') }]">
                    <label for="telefono_usuario">Teléfono</label>
                    <input type="number" class="form-control" id="telefono_usuario" name="telefono"  v-model="usuarios.telefono" placeholder="Teléfono" v-validate data-vv-rules="required|numeric|max:30">
                     <span  class="has-error error_absolute" v-show="errors.has('telefono')">{{ errors.first('telefono') }}</span>
                 </div>
                  <div class="form-group" v-bind:class="[errors_return.horas_disponible,{ 'has-error': errors.has('horas_disponible') }]">
                    <label for="horas_usuario">Horas Disponibles</label>
                    <input type="number" class="form-control" id="horas_usuario" name="horas_disponible" v-model="usuarios.horas_disponible"  placeholder="Horas Disponibles" v-validate data-vv-rules="required|numeric|max:30">
                     <span  class="has-error error_absolute" v-show="errors.has('horas_disponible')">{{ errors.first('horas_disponible') }}</span>
                 </div>
                  <div class="form-group" >
                    <label for="rol_usuario">Rol</label>
                    <select_rol :refresh="dato_refres"></select_rol>
                    <!-- <input type="text" class="form-control" id="rol_usuario" placeholder="Rol del usuario"> -->
                 </div>
                  <div class="form-group">
                    <label for="area_usuario">Área</label>
                    <select_area  :refresh="dato_refres"></select_area>
                 </div>
            </form> 
        </div>

        <div class="box-footer">
         
           <button class="btn btn-primary" v-bind:class="{ 'hidden': valorboton }" @click="addUser">Guardar</button>
           <button class="btn btn-primary" v-bind:class="{ 'hidden': valorboton2 }" @click="updateaddUser">Actualizar</button>
          
        </div>
    </div>
</template>

<script>
    import VeeValidate, { Validator } from 'vee-validate';

    Vue.component('select_area',require('../herramientas/select_area.vue'));
    Vue.component('select_rol',require('../herramientas/select_rol.vue'));


    Vue.use(VeeValidate);


    module.exports={
      components: {VeeValidate,Validator},
      props: ['titulor','comando'],
      data(){
        return{
          usuarios:{},
           message :'',
           titulo:'',
           valorboton:'',
           valorboton2:'',
           dato_refres:'',
           option_toast:{
            timeOut: 5000,
            "positionClass": "toast-top-center",
            "closeButton": true
           }, 
           errors_return:{
            'nombre':'',
            'apellido':'',
            'email':'',
            'password':'',
            'cargo':'',
            'telefono':'',
            'horas_disponible':''

          },
        }
       },
       created: function(){
          this.$on('rol_option', function(v) {
            this.usuarios.roles_id=v.id;
          });
          this.$on('area_option', function(b) {
            this.usuarios.areas_id=b.id;
          });
          console.log(this.comando);
          if (this.comando==1) {
            this.valorboton2=true;
          }else if(this.comando==2){
            
             this.valorboton=true;
          }
          
          this.titulo=this.titulor;   
      },
       methods:{
        addUser:function(user) {
          this.$validator.validateAll();
            if (this.errors.any()) {
              return false
            } 
          this.$http.post('api/v1/usuarios',this.usuarios)
          .then(function (response) {
                if (response.status != '200') {
                   if (Object.keys(response.obj).length>0) {
                   
                    $.each(respuesta.body.obj, function(index, value) {
                      that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
                      that.errors_return[index] = 'has-warning';
                    });
                  }
                  toastr.warning(that.message,respuesta.body.msg,this.option_toast);
                }else{
                    console.log(response);
                    toastr.success(response.body.msg,'',this.option_toast);
                   this.usuarios={};
                    this.dato_refres=0;
                }
                },(response) => {
                   var that = this;
                    that.message ='';
                    
                    console.log(response);
                      if (Object.keys(response.body.obj).length>0) {
                       
                        $.each(response.body.obj, function(index, value) {
                          that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
                          that.errors_return[index] = 'has-warning';
                        });
                      }

                    toastr.error(that.message,response.body.msg,this.option_toast);
                  });
        },
        updateaddUser:function(){
          console.log('Actualizar');
        }
       }
       
        
    }
   
</script>
