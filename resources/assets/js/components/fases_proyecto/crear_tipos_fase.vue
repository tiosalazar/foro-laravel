<template>
  <form class="row" name="agregar_fase" id="agregar_cliente">
  <!-- <div class="box-body"> -->
            <div class="col-xs-12 col-md-12">
              <div class="form-group" v-bind:class="[errors_return.nombre,{ 'has-error': errors.has('nombre') }]" >
                <label>Nombre</label>
                <input type="text" v-model="fase.nombre" v-validate data-vv-rules="required|alpha_num|min:3" name="nombre" id="nombre" class="form-control" required="required">
                <span  class="help-block" v-show="errors.has('nombre')">{{ errors.first('nombre') }}</span>
              </div>
              <div class="form-group">
                  <label>Descripción</label>
                  <textarea class="form-control" rows="2" placeholder="Descripcion del tipo de fase" name="descripcion" v-model="fase.descripcion"></textarea>
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
        console.log(this.fase_url)
        this.fase = this.fase_url;
      }
    },
    methods: {
      setErrors:function(object) {
            this.message='';
            var that = this;
            $.each(object, function(index, value) {
              that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
              that.errors_return[index] = 'has-warning';
            });
        },
      addfase: function(e) {
        this.$validator.validateAll();
          if (this.errors.any()) {
              return false
          }
        console.log(this.fase);
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
                  setTimeout(function(){ that.errors.clear(); }, 50); 
                }
               }, (response) => {
                console.log(response)
                that.message = '';
                if (Object.keys(response.body.obj).length>0) {
                  this.setErrors(response.body.obj);
                }else{
                  that.message = response.body.error;
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
