<template>
  <form class="row" name="agregar_fase" id="agregar_cliente">
    <!-- <div class="box-body"> -->
    <div class="col-xs-12 col-md-12">
      <div class="form-group" v-bind:class="[errors_return.nombre,{ 'has-error': errors.has('nombre') }]" >
        <label><sup>*</sup> Nombre</label>
        <input type="text" v-model="fase.nombre" v-validate data-vv-rules="required|alpha_num_spaces|min:3" name="nombre" id="nombre" class="form-control" required="required">
        <span  class="help-block" v-show="errors.has('nombre')">{{ errors.first('nombre') }}</span>
      </div>
      <!-- /.form-group -->
      <div class="form-group">
        <label><sup>*</sup> Tipo planeacion</label>
        <select_tipo_fase :select="this.tipo_fase"></select_tipo_fase>
      </div>
      <!-- /.form-group -->
    </div>
    <div class="col-xs-12 col-md-12">
      <button type="button" v-on:click="addfase" class="btn btn-flat btn-primary">Agregar</button>
    </div>
    <!-- </div> -->
  </form>
  <!-- /.row -->
</template>

<script>
  import VeeValidate, { Validator } from 'vee-validate';
  import messages from '../../es/es';

  Vue.component('select_tipo_fase',require('../herramientas/select_tipo_fase.vue'));

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
          tipo_fase:'',
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
        this.$on('tipo_fase_select', function(v) {
          this.tipo_fase=v;
          this.fase.planeacion_tipos_id = v.id;
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
              that.fase = {};
              this.tipo_fase={};
              setTimeout(function(){ that.errors.clear(); }, 50);
            }
          }, (err) => {
            that.message = '';
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
  </script>
