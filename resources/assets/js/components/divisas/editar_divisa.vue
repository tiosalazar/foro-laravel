<template>
  <div>
    <form class="row" name="agregar_fase" id="agregar_cliente">
      <!-- <div class="box-body"> -->
      <div class="col-xs-12 col-sm-12">
        <select_divisa :index="index" :select="divisa"></select_divisa>
      </div>
      <div class="col-xs-12 col-md-12">
        <div class="form-group" v-bind:class="[errors_return.nombre,{ 'has-error': errors.has('nombre') }]" >
          <label>Nombre</label>
          <input type="text" v-model="divisa.nombre" v-validate data-vv-rules="required|min:3" name="nombre" id="nombre" class="form-control" required="required">
          <span  class="help-block" v-show="errors.has('nombre')">{{ errors.first('nombre') }}</span>
        </div>
        <!-- /.form-group -->
        <div class="form-group">
          <label>Tasa de Conversión</label>
        <input type="number"name="tasa_conversion" id="tasa_conversion" class="form-control" v-model="divisa.tasa_conversion"></input>
        </div>
        <!-- /.form-group -->
      </div>
      <div class="col-xs-12 col-md-12">
        <button type="button" v-on:click="editDivisa" class="btn btn-flat btn-success">Editar</button>
        <button type="button" v-on:click="showModal(divisa)" class="btn btn-flat btn-danger pull-right">Borrar</button>
      </div>
      <!-- </div> -->
    </form>
    <!-- /.row -->
    <div class="modal" id="modal-divisa">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span></button>
              <h4 class="modal-title">Borrar Fase del Proyecto</h4>
            </div>
            <div class="modal-body">
              <p>Estas seguro que deseas borrar esta Divisa</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
              <button type="button" v-on:click="borrarDivisa" class="btn btn-danger">Borrar</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
    </div>
  </template>

<script>
  import VeeValidate, { Validator } from 'vee-validate';
  import messages from '../../es/es';

  Vue.component('select_divisa',require('../herramientas/select_divisas.vue'));

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
        divisa: {},
        message :'',
        index:'',
        tipo_divisa:0,
        divisa_a_borrar:{},
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
      this.$on('divisa', function(v) {
        this.divisa=v.divisa;
      });
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
      editDivisa: function() {
        this.$http.put(window._apiURL+'divisas/'+this.divisa.id, this.divisa)
        .then(function(response) {
          if (response.status != '200') {
            if (Object.keys(response.body.obj).length>0) {
              this.setErrors(response.body.obj);
            }
            toastr.warning(this.message,response.body.msg,this.option_toast);
          } else {
            toastr.success(response.body.msg,'',this.option_toast);
            this.divisa={};
            this.tipo_divisa=0;
          }
        }, function(err) {
          if (Object.keys(err.body.obj).length>0) {
            this.setErrors(err.body.obj);
          }
          toastr.error(this.message,err.body.msg,this.option_toast);
        }).then(() => {  
         this.errors.clear();
         console.log(this.errors);
       });
      },
      showModal:function(input) {
        $('#modal-divisa').modal('show');
        this.divisa_a_borrar = input;
      },
      borrarDivisa:function() {
        this.$http.delete(window._apiURL+'divisas/'+this.divisa_a_borrar.id)
        .then(function(response) {
          if (response.status != '200') {
            if (Object.keys(response.body.obj).length>0) {
              this.setErrors(response.body.obj);
            }
            toastr.warning(this.message,response.body.msg,this.option_toast);
          } else {
            toastr.success(response.body.msg,'',this.option_toast);
            this.divisa={};
            this.tipo_divisa=0;
            $('#modal-divisa').modal('hide');
          }
        }, function(err) {
          if (Object.keys(err.body.obj).length>0) {
            this.setErrors(err.body.obj);
          }
          toastr.error(this.message,err.body.msg,this.option_toast);
        })

      },
    }
  }
</script>
