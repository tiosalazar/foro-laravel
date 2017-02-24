<template >
      <div  :class="{'box box-primary': visualizar != 1 }" id="crear_user">
        <div class="box-header" v-show="visualizar != 1">
            <h3>{{titulo}}</h3>

        </div>

        <div class="box-body">
            <form  role="form">
                <div class="form-group" v-bind:class="[errors_return.nombre,{ 'has-error': errors.has('nombre') }]">
                    <label for="nombre_usuario">Nombre</label>
                    <input type="text" class="form-control" id="nombre_usuario" name="nombre" v-model="usuarios.nombre" placeholder="Nombre" v-validate data-vv-rules="required|alpha_num_spaces|max:50">
                    <span  class="help-block error_absolute" v-show="errors.has('nombre')">{{ errors.first('nombre') }}</span>
                </div>
                <div class="form-group" v-bind:class="[errors_return.apellido,{ 'has-error': errors.has('apellido') }]">
                    <label for="apellidos_usuario">Apellidos</label>
                    <input type="text" class="form-control" id="apellidos_usuario" name="apellido"  v-model="usuarios.apellido" placeholder="Apellidos" v-validate data-vv-rules="required|alpha_num_spaces|max:50">
                    <span  class="help-block error_absolute" v-show="errors.has('apellido')">{{ errors.first('apellido') }}</span>
                </div>
                <div class="form-group" v-bind:class="[errors_return.email,{ 'has-error': errors.has('email') }]">
                    <label for="email_usuario">Email</label>
                    <input type="email" class="form-control" id="email_usuario"  name="email" v-model="usuarios.email" placeholder="Email" v-validate data-vv-rules="required|email">
                     <span  class="help-block error_absolute" v-show="errors.has('email')">{{ errors.first('email') }}</span>
                </div>
                 <div class="form-group" v-bind:class="[errors_return.password,{ 'has-error': errors.has('password') }]">
                    <label for="contrasena_usuario">Contraseña</label>
                    <input type="text" class="form-control" id="contrasena_usuario" name="password" v-model="usuarios.password"  placeholder="Contraseña" v-validate :data-vv-rules="validacioncontrasena">

                     <span  class="help-block error_absolute" v-show="errors.has('password')">{{ errors.first('password') }}</span>
                </div>
                 <div class="form-group" v-bind:class="[errors_return.cargo,{ 'has-error': errors.has('cargo') }]">
                    <label for="cargo_usuario">Cargo</label>
                    <input type="text" class="form-control" id="cargo_usuario" name="cargo" v-model="usuarios.cargo"  placeholder="Cargo" v-validate data-vv-rules="required|alpha_num_spaces|max:30">
                     <span  class="help-block error_absolute" v-show="errors.has('cargo')">{{ errors.first('cargo') }}</span>
                 </div>
                 <div class="form-group" v-bind:class="[errors_return.telefono,{ 'has-error': errors.has('telefono') }]">
                    <label for="telefono_usuario">Teléfono</label>
                    <input type="text" class="form-control" id="telefono_usuario" name="telefono"  v-model="usuarios.telefono" placeholder="Teléfono" v-validate data-vv-rules="required|numeric|max:30">
                     <span  class="help-block error_absolute" v-show="errors.has('telefono')">{{ errors.first('telefono') }}</span>
                 </div>
                  <div class="form-group" v-bind:class="[errors_return.horas_disponible,{ 'has-error': errors.has('horas_disponible') }]">
                    <label for="horas_usuario">Horas al mes</label>
                    <input type="text" class="form-control" id="horas_usuario" name="horas_disponible" v-model="usuarios.horas_disponible"  placeholder="Horas Disponibles" v-validate data-vv-rules="required|decimal|max:30">
                     <span  class="help-block error_absolute" v-show="errors.has('horas_disponible')">{{ errors.first('horas_disponible') }}</span>
                 </div>
                  <div class="form-group" v-bind:class="[errors_return.fecha_nacimiento,{ 'has-error': errors.has('fecha_nacimiento') }]">
                    <label for="fecha_nacimiento">Fecha de nacimiento</label>
                    <input type="date" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento" v-model="usuarios.fecha_nacimiento"  placeholder="Fecha nacimiento" v-validate data-vv-rules="required">
                     <span  class="help-block error_absolute" v-show="errors.has('fecha_nacimiento')">{{ errors.first('fecha_nacimiento') }}</span>
                 </div>
                  <div class="form-group" >
                    <label for="rol_usuario">Rol</label>
                    <select_rol :refresh="dato_refres"></select_rol>
                    <!-- <input type="text" class="form-control" id="rol_usuario" placeholder="Rol del usuario"> -->
                 </div>
                  <div class="form-group">
                    <label for="area_usuario">Área</label>
                    <select_area  :refresha="dato_refres2"></select_area>
                 </div>
                 <!-- Campo estado que solo se muestra cuando vamos a actualizar el usuario -->
                  <div class="form-group" v-bind:class="{ 'hidden': valorboton2 }">
                    <label for="horas_usuario">Estado</label>
                    <select name="estado" id="" class="form-control select_custom" v-model="usuarios.estado">
                      <option value="0">Inactivo</option>
                      <option value="1">Activo</option>
                    </select>
                 </div>

            </form>
        </div>

        <div class="box-footer">

           <button class="btn btn-primary" v-bind:class="{ 'hidden': valorboton }" @click="addUser">Guardar</button>
           <button class="btn btn-primary" v-bind:class="{ 'hidden': valorboton2 }" @click="updateaddUser">Actualizar</button>
           <a href="/equipo/directorio" v-bind:class="{ 'hidden': valorboton2 }"><button class="btn btn-default">Volver a listado áreas</button></a>

        </div>
    </div>
</template>

<script>


    Vue.component('select_area',require('../herramientas/select_area.vue'));
    Vue.component('select_rol',require('../herramientas/select_rol.vue'));
    import VeeValidate, { Validator } from 'vee-validate';
    //Traducciones del validador
    import messages from '../../es/es';

    //Realizando los Use
    // Merge the locales.
    Validator.updateDictionary({es: { messages }});
    // Install the plugin and set the locale.
    Vue.use(VeeValidate, { locale: 'es' });

    /*Validación Alfa Numerico con ñ*/
    VeeValidate.Validator.extend('alpha_num_spaces', {
    getMessage: field => 'El campo '+field+' solo debe contener letras y números.',
    validate: value => /^[\u00F1Aa-\u00F1AZ-a-zA-Z0-9_  \u00e1\u00e9\u00ed\u00f3\u00fa\u00c1\u00c9\u00cd\u00d3\u00da]*$/.test(value)
        /*
        \u00e1 = á
        \u00e9 = é
        \u00ed = í
        \u00f3 = ó
        \u00fa = ú
        \u00c1 = Á
        \u00c9 = É
        \u00cd = Í
        \u00d3 = Ó
        \u00da = Ú
        \u00f1 = ñ
        \u00d1 = Ñ*/
  });


    module.exports={
      components: {VeeValidate,Validator},
      props: ['titulor','comando','edituserdata','visualizar'],
      data(){
        return{
           usuarios:{
              nombre:'',
              apellido:'',
              email:'',
              password:'',
              cargo:'',
              telefono:'',
              horas_disponible:'',
              fecha_nacimiento:''
           },
           message :'',
           titulo:'',
           validacioncontrasena:'required',
           valorboton:'',
           valorboton2:'',
           dato_refres:'',
           dato_refres2:'',
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
            'horas_disponible':'',
            'fecha_nacimiento':''

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

          //Valido la opcion de editar o guardar para mostrar el boto correspondiente con su función
          if (this.comando==1) {
            this.valorboton2=true;
          }else if(this.comando==2){

             this.valorboton=true;
          }
          //Valido que recibo los datos para editar, si es el caso lleno el componente del formulario

          if (this.edituserdata!=undefined) {
            this.validacioncontrasena='';
            console.log(this.edituserdata);
            var obj = JSON.parse(this.edituserdata);
            console.log(obj);
             this.usuarios=obj;
             this.dato_refres=obj;
              this.dato_refres2=obj;
            }


          this.titulo=this.titulor;
      },
       methods:{
        addUser:function(user) {
          this.$validator.validateAll();
            if (this.errors.any()) {
              return false
            }
          this.$http.post(window._apiURL+'usuarios',this.usuarios)
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
                    this.dato_refres2=0;
                    if($('#tabla_usuarios') ){
                        $('#tabla_usuarios').DataTable().ajax.reload();
                    }


                    
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
                  }).then(() => {  
                     this.errors.clear();
                     console.log(this.errors);
                   });
        },
        updateaddUser:function(){
          console.log('Actualizar');
          //Valido los campos
           this.$validator.validateAll();
            if (this.errors.any()) {
              return false
            }


            var estado = parseInt(this.usuarios.estado);
            this.usuarios.estado= estado;
            var iduser=this.usuarios.id;

            //Peticion enviando los datos actualizados
            this.$http.put(window._apiURL+'usuarios/'+iduser+'', this.usuarios).then(function(response){
                if (response.status != '200') {
                   if (Object.keys(response.obj).length>0) {

                    $.each(respuesta.body.obj, function(index, value) {
                      that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
                      that.errors_return[index] = 'has-warning';
                    });
                  }
                  toastr.warning(that.message,respuesta.body.msg,this.option_toast);
                }else{

                    toastr.success(response.body.msg,'',this.option_toast);
                    console.log(response);

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

        }
       }


    }

</script>
