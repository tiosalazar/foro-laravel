<template>
  <form class="row" name="agregar_fase" id="agregar_cliente">
    <!-- <div class="box-body"> -->
    <div class="col-xs-12 col-md-12">
      <div class="form-group" v-bind:class="[errors_return.nombre,{ 'has-error': errors.has('nombre') }]" >
        <label><sup>*</sup> Nombre</label>
        <input type="text" v-model="fase.nombre" v-validate data-vv-rules="required|alpha_num_spaces|min:3" name="nombre" id="nombre" class="form-control" required="required">
        <span  class="help-block" v-show="errors.has('nombre')">{{ errors.first('nombre') }}</span>
      </div>
      <div class="form-group">
        <label for="area">&Aacute;rea</label>
        <select_area  :refresha="refresh"></select_area>
      </div>
      <div class="form-group">
        <label>Descripción</label>
        <textarea class="form-control" rows="2" placeholder="Descripcion del tipo de fase" name="descripcion" v-model="fase.descripcion"></textarea>
      </div>
      <!-- /.form-group -->
    </div>
    <div class="col-xs-12 col-md-12">
      <button type="button" v-on:click="addfase" class="btn btn-flat btn-success pull-right">Agregar</button>
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
      props: ['fase_url'],
      data () {
        return {
          isActive:true,
          fase: {},
          message :'',
          refresh:'',
          option_toast:{
            timeOut: 5000,
            "positionClass": "toast-top-center",
            "closeButton": true,
          },
          errors_return:{
            'nombre':'',
            'nombre_contacto':'',
            'telefono':'',
            'email':'',
          }
        }
      },
      created:function() {
        if (this.fase_url) {
          this.fase = this.fase_url;
        }
        this.$on('area_option', function(obj) {
          console.log(obj);
  				this.fase.areas_id =  obj.id;
  			});
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
          var that = this;

          this.$http.post(window._apiURL+'tipos_fase', this.fase)
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
              that.fase = {};
              this.refresh=0;
              setTimeout(function(){ that.errors.clear(); }, 50);
            }
          }, (err) => {
            if (err.status == 404) {
              toastr.error('No se encontraron resultados, verfique la informacion','Error',this.option_toast);
            } else {
              if (Object.keys(err.body.obj).length>0) {
                this.setErrors(err.body.obj);
              }else{
                that.message = err.body.error;
              }
              toastr.error(this.message,err.body.msg,this.option_toast);
            }
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
            if (err.status == 404) {
              toastr.error('No se encontraron resultados, verfique la informacion','Error',this.option_toast);
            } else {
              if (Object.keys(err.body.obj).length>0) {
                this.setErrors(err.body.obj);
              }else{
                that.message = err.body.error;
              }
              toastr.error(this.message,err.body.msg,this.option_toast);
            }
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
    Vue.component('select_area',require('../herramientas/select_area.vue'));
  </script>
