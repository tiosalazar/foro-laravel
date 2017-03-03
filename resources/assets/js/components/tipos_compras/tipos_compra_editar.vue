<template>
  <div>
    <form class="row" name="agregar_fase" id="agregar_cliente">
      <!-- <div class="box-body"> -->
      <div class="col-xs-12 col-sm-12">
        <select_tipo_compra></select_tipo_compra>
      </div>
      <div class="col-xs-12 col-md-12">
        <div class="form-group" v-bind:class="[errors_return.nombre,{ 'has-error': errors.has('nombre') }]" >
          <label>Nombre</label>
          <input type="text" v-model="compra.nombre" v-validate data-vv-rules="required|min:3" name="nombre" id="nombre" class="form-control" required="required">
          <span  class="help-block" v-show="errors.has('nombre')">{{ errors.first('nombre') }}</span>
        </div>
      </div>
      <div class="col-xs-12 col-md-12">
        <button type="button" v-on:click="EditTipoCompra" class="btn btn-flat btn-success">Editar</button>
        <button type="button" v-on:click="showModal(compra)" class="btn btn-flat btn-danger pull-right">Borrar</button>
      </div>
      <!-- </div> -->
    </form>
    <!-- /.row -->
    <div class="modal" id="modal-fase">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span></button>
              <h4 class="modal-title">Borrar tipo de compra</h4>
            </div>
            <div class="modal-body">
              <p>Estas seguro que deseas borrar este tipo de compra</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
              <button type="button" v-on:click="BorrarTipoCompra" class="btn btn-danger">Borrar</button>
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

  Vue.component('select_tipo_compra',require('../herramientas/select_tipo_compra.vue'));
  

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
        message :'',
        tipo_fase:0,
        compra:{},
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
      this.$on('tipo_compra', function(v) {
       this.compra=v.tipo_compra;
       console.log(this.compra);
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
      EditTipoCompra: function() {
       this.$http.put(window._apiURL+'tipos_compra/'+this.compra.id, this.compra)
       .then(function(respuesta){
           toastr.success(respuesta.body.msg,'',this.option_toast);

       });
      },
      showModal:function(input) {
        $('#modal-fase').modal('show');
        this.fase_a_borrar = input;
      },
      BorrarTipoCompra:function() {
        this.$http.delete(window._apiURL+'tipos_compra/'+this.compra.id)
        .then(function(respuesta) {
        toastr.success(respuesta.body.msg,'',this.option_toast);
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
