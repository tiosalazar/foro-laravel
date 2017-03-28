<template>
  <form class="row" name="agregar_fase" id="agregar_cliente">
    <!-- <div class="box-body"> -->
    <div class="col-xs-12 col-md-12">
      <div class="form-group" v-bind:class="[errors_return.nombre,{ 'has-error': errors.has('nombre') }]" >
        <label><sup>*</sup> Nombre </label>
        <input type="text" v-model="divisa.nombre" v-validate data-vv-rules="required|alpha_num_spaces|min:3" name="nombre" id="nombre" class="form-control" required="required">
        <span  class="help-block" v-show="errors.has('nombre')">{{ errors.first('nombre') }}</span>
      </div>
      <!-- /.form-group -->
      <div class="form-group">
        <label>Tasa de Conversión</label>
        <textarea name="tasa_conversion" id="tasa_conversion" cols="30" rows="2" class="form-control" v-model="divisa.tasa_conversion"></textarea>
      </div>
      <!-- /.form-group -->
    </div>
    <div class="col-xs-12 col-md-12">
      <button type="button" v-on:click="addDivisa" class="btn btn-flat btn-success pull-right">Agregar</button>
    </div>
    <!-- </div> -->
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
      props: ['divisa_url'],
      data () {
        return {
          isActive:true,
          divisa: {},
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
        if (this.divisa_url) {
          this.divisa = this.divisa_url;
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
        addDivisa: function(e) {
          this.$validator.validateAll();
          if (this.errors.any()) {
            return false
          }
          var that = this;
          this.$http.post(window._apiURL+'divisas', this.divisa)
          .then(function(respuesta){
            console.log(respuesta)
            that.message ='';
            if (respuesta.status != '200') {
              if (Object.keys(respuesta.body.obj).length>0) {
                this.setErrors(respuesta.body.obj);
              }
              toastr.warning(that.message,respuesta.body.msg,this.option_toast);
            } else {
              toastr.success(respuesta.body.msg,'',this.option_toast);
              that.divisa = {};
              setTimeout(function(){ that.errors.clear(); }, 50);
            }
          }, (response) => {
            that.message = '';
            if (response.status == 404) {
              toastr.error('No se encontraron resultados, verfique la informacion','Error',this.option_toast);
            } else {
              if (Object.keys(response.body.obj).length>0) {
                this.setErrors(response.body.obj);
              }else{
                that.message = response.body.error;
              }
              toastr.error(this.message,response.body.msg,this.option_toast);
            }
          });
        },
      }
    }
  </script>
