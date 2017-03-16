<template>
  <form class="row" name="agregar_fase" id="agregar_cliente">
    <div class="col-xs-12 col-md-12">
      <div class="form-group" v-bind:class="[errors_return.nombre,{ 'has-error': errors.has('nombre') }]" >
        <label>Nombre</label>
        <input type="text" v-model="fase.nombre" v-validate data-vv-rules="required|alpha_num|min:3" name="nombre" id="nombre" class="form-control" required="required">
        <span  class="help-block" v-show="errors.has('nombre')">{{ errors.first('nombre') }}</span>
      </div>
      <!-- /.form-group -->
      <div class="form-group" v-bind:class="[errors_return.nombre_contacto,{ 'has-error': errors.has('nombre_contacto') }]">
        <label>Nombre de Contacto</label>
        <input type="text" v-model="fase.nombre_contacto" v-validate data-vv-rules="alpha|min:3"  name="nombre_contacto" id="nombre_contacto" class="form-control">
        <span  class="help-block" v-show="errors.has('nombre_contacto')">{{ errors.first('nombre_contacto') }}</span>
      </div>
      <!-- /.form-group -->
    </div>
    <!-- /.col -->
    <div class="col-xs-12 col-md-12">
      <div class="form-group" v-bind:class="[errors_return.nit,{ 'has-error': errors.has('nit') }]">
        <label>NIT</label>
        <input type="text" v-model="fase.nit" v-validate data-vv-rules="required|alpha_num|min:3" name="nit" id="nit" class="form-control" required="required">
        <span  class="help-block" v-show="errors.has('nit')">{{ errors.first('nit') }}</span>
      </div>
      <!-- /.form-group -->
      <div class="form-group" v-bind:class="[errors_return.email,{ 'has-error': errors.has('email') }]">
        <label>Correo</label>
        <input type="email" v-model="fase.email" v-validate data-vv-rules="email" name="email" id="email" class="form-control">
        <span  class="help-block" v-show="errors.has('email')">{{ errors.first('email') }}</span>
      </div>
      <!-- /.form-group -->
    </div>
    <!-- /.col -->
    <div class="col-xs-6 col-md-12">
      <div class="form-group" v-bind:class="[errors_return.telefono,{ 'has-error': errors.has('telefono') }]">
        <label>Teléfono</label>
        <input type="text" v-model="fase.telefono" v-validate data-vv-rules="min:5" name="telefono" id="telefono" class="form-control">
        <span  class="help-block" v-show="errors.has('telefono')">{{ errors.first('telefono') }}</span>
      </div>
      <!-- /.form-group -->
    </div>
    <div class="col-xs-6 col-md-12">
      <button type="button" v-show="agregar" v-on:click="addfase" class="btn btn-block btn-success aa">Agregar</button>
      <button type="button" v-show="!agregar" v-on:click="editfase(fase)" class="btn btn-block btn-success aa">Editar</button>
    </div>
  </form>
  <!-- /.row -->
</template>

<script>
  import VeeValidate, { Validator } from 'vee-validate';
  import messages from '../../es/es';
  // Merge the locales.
  Validator.updateDictionary({es: { messages }});
  // Install the plugin and set the locale.
  Vue.use(VeeValidate, { locale: 'es' });

  module.exports =  {
    components: {VeeValidate,Validator},
    props: ['fase_url'],
    data () {
      return {
        isActive:true,
        fase: {},
        message :'',
        agregar:true,
        option_toast:{
          timeOut: 5000,
          "positionClass": "toast-top-center",
          "closeButton": true,
        },
        errors_return:{
          'nombre':'',
          'nit':'',
          'nombre_contacto':'',
          'telefono':'',
          'email':'',
        }
      }
    },
    created:function() {
      if (this.fase_url) {
        this.fase = this.fase_url;
        this.agregar = false;
      }
    },
    methods: {
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
      addfase: function(e) {
        this.$validator.validateAll();
        if (this.errors.any()) {
          return false
        }
        let that = this;
        this.$http.post(window._apiURL+'fases', this.fase)
        .then(function(respuesta){
          that.message ='';
          if (respuesta.status != '200') {
            if (Object.keys(respuesta.body.obj).length>0) {
              this.setErrors(respuesta.body.obj);
            }
            toastr.warning(that.message,respuesta.body.msg,this.option_toast);
          } else {
            toastr.success(respuesta.body.msg,'',this.option_toast);
          }
        }, (response) => {
          that.message = '';
          if (Object.keys(response.body.obj).length>0) {
            this.setErrors(response.body.obj);
          }
          toastr.error(that.message,response.body.msg,this.option_toast);
        });
      },
      editfase: function(client) {
        this.$http.put(window._apiURL+'fases/'+client.id, client)
        .then(function(response) {
          if (response.status != '200') {
            if (Object.keys(response.body.obj).length>0) {
              this.setErrors(response.body.obj);
            }
            toastr.warning(this.message,response.body.msg,this.option_toast);
          } else {
            toastr.success(response.body.msg,'',this.option_toast);
            this.fase={};
          }
        }, function(err) {
          if (Object.keys(err.body.obj).length>0) {
            this.setErrors(err.body.obj);
          }
          toastr.error(this.message,err.body.msg,this.option_toast);
        })
      },
      deleteRequerimiento: function(e) {
        e.preventDefault();
        var index = this.requerimiento.indexOf(Vue.util.extend({}, this.requerimiento));
        this.requerimiento.splice(index, 1);

      },
      validateBeforeSubmit(e) {
        console.log(this.errors);
        this.$validator.validateAll();
        if (!this.errors.any()) {
          this.submitForm()
        }
      },
    }
  }
</script>
