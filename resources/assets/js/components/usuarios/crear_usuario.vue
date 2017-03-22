<template >
      <div  :class="{'box box-primary': visualizar != 1 }" id="crear_user">

        <div class="box-body">
            <form  role="form" class="row">
                <div class="col-md-6 same-height">
                  <div class="form-group" v-bind:class="[errors_return.nombre,{ 'has-error': errors.has('nombre') }]">
                    <label for="nombre_usuario"><sup>*</sup> Nombre </label>
                    <input type="text" class="form-control" id="nombre_usuario" name="nombre" v-model="usuarios.nombre" placeholder="Nombre" v-validate data-vv-rules="required|alpha_num_spaces|max:50">
                    <span  class="help-block error_absolute" v-show="errors.has('nombre')">{{ errors.first('nombre') }}</span>
                </div>
                </div>
                <div class="col-md-6 same-height">
                  <div class="form-group" v-bind:class="[errors_return.apellido,{ 'has-error': errors.has('apellido') }]">
                    <label for="apellidos_usuario"><sup>*</sup> Apellidos </label>
                    <input type="text" class="form-control" id="apellidos_usuario" name="apellido"  v-model="usuarios.apellido" placeholder="Apellidos" v-validate data-vv-rules="required|alpha_num_spaces|max:50">
                    <span  class="help-block error_absolute" v-show="errors.has('apellido')">{{ errors.first('apellido') }}</span>
                </div>
                </div>
                <div class="col-md-6 same-height">
                  <div class="form-group" v-bind:class="[errors_return.email,{ 'has-error': errors.has('email') }]">
                    <label for="email_usuario"><sup>*</sup> Email </label>
                    <input type="email" class="form-control" id="email_usuario"  name="email" v-model="usuarios.email" placeholder="Email" v-validate data-vv-rules="required|email">
                     <span  class="help-block error_absolute" v-show="errors.has('email')">{{ errors.first('email') }}</span>
                </div>
                </div>
                 <div class="col-md-6 same-height">
                   <div class="form-group" v-bind:class="[errors_return.password,{ 'has-error': errors.has('password') }]">
                    <label for="contrasena_usuario"><sup>*</sup> Contraseña </label>
                    <input type="text" class="form-control" id="contrasena_usuario" name="password" v-model="usuarios.password"  placeholder="Contraseña" v-validate :data-vv-rules="validacioncontrasena">

                     <span  class="help-block error_absolute" v-show="errors.has('password')">{{ errors.first('password') }}</span>
                </div>
                 </div>
                 <div class="col-md-6 same-height">
                   <div class="form-group" v-bind:class="[errors_return.cargo,{ 'has-error': errors.has('cargo') }]">
                    <label for="cargo_usuario"><sup>*</sup> Cargo </label>
                    <input type="text" class="form-control" id="cargo_usuario" name="cargo" v-model="usuarios.cargo"  placeholder="Cargo" v-validate data-vv-rules="required|alpha_num_spaces|max:30">
                     <span  class="help-block error_absolute" v-show="errors.has('cargo')">{{ errors.first('cargo') }}</span>
                 </div>
                 </div>
                 <div class="col-md-6 same-height">
                   <div class="form-group" v-bind:class="[errors_return.telefono,{ 'has-error': errors.has('telefono') }]">
                    <label for="telefono_usuario">Teléfono</label>
                    <input type="text" class="form-control" id="telefono_usuario" name="telefono"  v-model="usuarios.telefono" placeholder="Teléfono" v-validate data-vv-rules="numeric|max:30">
                     <span  class="help-block error_absolute" v-show="errors.has('telefono')">{{ errors.first('telefono') }}</span>
                 </div>
                 </div>
                  <div class="col-md-6 same-height">
                    <div class="form-group" v-bind:class="[errors_return.horas_disponible,{ 'has-error': errors.has('horas_disponible') }]">
                    <label for="horas_usuario"><sup>*</sup> Horas al mes </label>
                    <input type="text" class="form-control" id="horas_usuario" name="horas_disponible" v-model="usuarios.horas_disponible"  placeholder="Horas Disponibles" v-validate data-vv-rules="required|decimal|max:30">
                     <span  class="help-block error_absolute" v-show="errors.has('horas_disponible')">{{ errors.first('horas_disponible') }}</span>
                 </div>
                  </div>
                  <div class="col-md-6 same-height">
                  <div class="form-group required" v-bind:class="[errors_return.fecha_nacimiento,{ 'has-error': errors.has('fecha_nacimiento') }]">
                    <label for="fecha_nacimiento">Fecha de nacimiento</label>
                    <div class="input-group date">
                      <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                      <datepicker language="es" id="fecha_inicio" required="required" v-validate data-vv-rules="required" data-vv-as="Fecha de Nacimiento" placeholder="Fecha nacimiento"  v-model="usuarios.fecha_nacimiento" name="fecha_nacimiento" class="form-control" :disabled="disabled"  format="dd-MM-yyyy"></datepicker>
                    </div>
                     <span  class="help-block error_absolute" v-show="errors.has('fecha_nacimiento')">{{ errors.first('fecha_nacimiento') }}</span>
                 </div>
                 </div>
                  <div class="col-md-6 same-height">
                    <div class="form-group" >
                    <label for="rol_usuario"><sup>*</sup> Rol </label>
                    <select_rol :refresh="rol"></select_rol>
                    <!-- <input type="text" class="form-control" id="rol_usuario" placeholder="Rol del usuario"> -->
                 </div>
                  </div>
                  <div class="col-md-6 same-height">
                    <div class="form-group">
                    <label for="area_usuario"><sup>*</sup> Área </label>
                    <select_area  :refresha="area"></select_area>
                 </div>
                  </div>
                 <!-- Campo estado que solo se muestra cuando vamos a actualizar el usuario -->
                  <div class="col-md-6 same-height" v-bind:class="{ 'hidden': botonEditar }">
                    <div class="form-group" >
                    <label for="horas_usuario">Estado</label>
                    <select name="estado" id="" class="form-control select_custom" v-model="usuarios.estado">
                      <option value="0">Inactivo</option>
                      <option value="1">Activo</option>
                    </select>
                 </div>
                  </div>

            </form>
        </div>

        <div class="box-footer">

           <button class="btn btn-primary pull-right" v-bind:class="{ 'hidden': botonGuardar }" @click="addUser">Guardar</button>
           <button class="btn btn-primary pull-right" v-bind:class="{ 'hidden': botonEditar }" @click="updateaddUser">Actualizar</button>
           <a href="/equipo/usuarios" v-bind:class="{ 'hidden': botonEditar }"><button class="btn btn-primary pull-left">Volver a listado Usuarios</button></a>

        </div>
    </div>
</template>

<script>
  Vue.component('select_area',require('../herramientas/select_area.vue'));
  Vue.component('select_rol',require('../herramientas/select_rol.vue'));
  import VeeValidate, { Validator } from 'vee-validate';
  import Datepicker from 'vuejs-datepicker';
  import moment from 'moment';
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
    });


    module.exports={
      components: {VeeValidate,Validator,Datepicker},
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
        botonGuardar:'',
        botonEditar:'',
        rol:'',
        area:'',
        disabled:{
          to:'',
          from:moment().subtract(18,'y').toDate(),
        },
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
          //Valido la opcion de editar o guardar para mostrar el boton correspondiente con su función
          if (this.comando==1) {
            this.botonEditar=true;
          }else if(this.comando==2){
           this.botonGuardar=true;
         }
          //Valido que recibo los datos para editar, si es el caso lleno el componente del formulario

          if (this.edituserdata!=undefined) {
            this.validacioncontrasena='';
            var obj = JSON.parse(this.edituserdata);
            this.usuarios=obj;
            this.rol=obj;
            this.area=obj;
          }


          this.titulo=this.titulor;
        },
        methods:{
          setErrors:function(object) {
            this.message='';
            var that = this;
            $.each(object, function(index, value) {
              let campo = index.replace(/_id/g, '');
              campo = campo.replace(/_/g, ' ');
              value = value[0].replace(/ id /g, '');
              that.message += '<strong>'+campo + '</strong>: '+value+ '</br>';
              that.errors_return[index] = 'has-warning';
            });
          },
          addUser:function(user) {
            this.$validator.validateAll();
            if (this.errors.any()) {
              return false
            }
            let that = this;
            this.usuarios.fecha_nacimiento = moment(this.usuarios.fecha_nacimiento).format('YYYY-MM-DD');
            this.$http.post(window._apiURL+'usuarios',this.usuarios)
            .then(function (response) {

              if (response.status != '200') {
                if (Object.keys(response.body.obj).length>0) {
                  this.setErrors(response.body.obj);
                }
              toastr.warning(that.message,respuesta.body.msg,this.option_toast);
            }else{
              console.log(response);
              toastr.success(response.body.msg,'',this.option_toast);
              this.usuarios={};
              this.rol=0;
              this.area=0;
              if($('#tabla_usuarios') ){
                $('#tabla_usuarios').DataTable().ajax.reload();
              }
              setTimeout(function(){ that.errors.clear(); }, 50);



            }
          },(response) => {
           let that = this;
           that.message ='';
           if (err.status == 404) {
            toastr.error('No se encontraron resultados, verfique la informacion','Error',this.option_toast);
          } else {
            if (Object.keys(err.body.obj).length>0) {
              this.setErrors(err.body.obj);
            }else{
              that.message = response.body.error;
            }
            toastr.error(this.message,err.body.msg,this.option_toast);
          }
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
          let estado = parseInt(this.usuarios.estado);
          this.usuarios.estado= estado;
          let that = this;
          //Peticion enviando los datos actualizados
          this.$http.put(window._apiURL+'usuarios/'+this.usuarios.id+'', this.usuarios).then(function(response){
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
