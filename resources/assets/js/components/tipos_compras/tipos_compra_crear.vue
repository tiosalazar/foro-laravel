<template>
  <div>
    <form class="row" name="agregar_compra" id="agregar_cliente">
  
      <div class="col-xs-12 col-md-12">
        <div class="form-group" v-bind:class="[errors_return.nombre,{ 'has-error': errors.has('nombre') }]" >
          <label>Nombre</label>
          <input type="text" v-model="compra.nombre" v-validate data-vv-rules="required|min:3" name="nombre" id="nombre" class="form-control" required="required">
          <span  class="help-block" v-show="errors.has('nombre')">{{ errors.first('nombre') }}</span>
        </div>
      </div>
      <div class="col-xs-12 col-md-12">
        <button type="button" v-on:click="crearcompra" class="btn btn-flat btn-success">Crear</button> 
      </div>
    </form>
  
  </div>
   
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
    data () {
      return {
        isActive:true,
        compra: {},
        message :'',
        option_toast:{
          timeOut: 5000,
          "positionClass": "toast-top-center",
          "closeButton": true,
        },
        errors_return:{
          'nombre':'',
        }
      }
    },
    created:function() { 
 
    },
    methods: {
      crearcompra:function(){
         this.$http.post(window._apiURL+'tipos_compra', this.compra)
         .then(function(respuesta){
           toastr.success(respuesta.body.msg,'',this.option_toast);
         });
      },   
      setErrors:function(object) {
        this.message='';
        var that = this;
        $.each(object, function(index, value) {
          that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
          that.errors_return[index] = 'has-warning';
        });
      },
     
    }
  }
</script>
