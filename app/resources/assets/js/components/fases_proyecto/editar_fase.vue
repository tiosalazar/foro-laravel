<template>
  <div>
    <form class="row" name="agregar_fase" id="agregar_cliente">
      <!-- <div class="box-body"> -->
      <div class="col-xs-12 col-sm-12">
        <select_fase :select="fase_select" :area="area"></select_fase>
      </div>
      <div class="col-xs-12 col-md-12">
        <div class="form-group" v-bind:class="[errors_return.nombre,{ 'has-error': errors.has('nombre') }]" >
          <label><sup>*</sup> Nombre </label>
          <input type="text" v-model="fase.nombre" v-validate data-vv-rules="required|min:3" name="nombre" id="nombre" class="form-control" required="required">
          <span  class="help-block" v-show="errors.has('nombre')">{{ errors.first('nombre') }}</span>
        </div>
        <!-- /.form-group -->
        <div class="form-group">
          <label><sup>*</sup> Tipo planeacion</label>
          <select_tipo_fase :tipos="tipo_fase" ></select_tipo_fase>
        </div>
        <!-- /.form-group -->
      </div>
      <div class="col-xs-12 col-md-12">
        <button type="button" v-on:click="editfase" class="btn btn-flat btn-success pull-right">Editar</button>
        <button type="button" v-on:click="showModal(fase)" class="btn btn-flat btn-danger ">Borrar</button>
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
              <h4 class="modal-title">Borrar Fase del Proyecto</h4>
            </div>
            <div class="modal-body">
              <p>Estas seguro que deseas borrar esta Fase del Proyecto</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
              <button type="button" v-on:click="borrarFase" class="btn btn-danger">Borrar</button>
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

  Vue.component('select_tipo_fase',require('../herramientas/select_tipo_fase.vue'));
  Vue.component('select_fase',require('../herramientas/select_fase.vue'));

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
        fase_select: 0,
        message :'',
        tipo_fase:0,
        fase_a_borrar:{},
        area:{},
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
      if (this.fase_url) {
        this.fase = this.fase_url;
      }
      this.$on('tipo_fase_select', function(v) {
        this.tipo_fase=v.id;
        this.fase.planeacion_tipos_id = v.id;
      });
      this.$on('fase_option', function(v) {
        this.tipo_fase = v.planeacion_tipos_id;
        this.fase.id = v.id;
        this.fase.planeacion_tipos_id = v.planeacion_tipos_id;
        this.fase.nombre = v.nombre;
      });
    },
    methods: {
      getFase:function() {
        this.$http.get(window._apiURL+'fases', this.fase)
        .then(function(respuesta){
          this.fase = respuesta.obj;
        })
      },
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
      editfase: function() {
        this.$http.put(window._apiURL+'fases/'+this.fase.id, this.fase)
        .then(function(response) {
          if (response.status != '200') {
            if (Object.keys(response.body.obj).length>0) {
              this.setErrors(response.body.obj);
            }
            toastr.warning(this.message,response.body.msg,this.option_toast);
          } else {
            toastr.success(response.body.msg,'',this.option_toast);
            this.fase={};
            this.fase_select={};
            this.tipo_fase=0;
          }
        }, function(err) {
          if (err.status == 404) {
            toastr.error('No se encontraron resultados, verfique la informacion','Error',this.option_toast);
          } else {
            if (Object.keys(err.body.obj).length>0) {
              this.setErrors(err.body.obj);
            }
            toastr.error(this.message,err.body.msg,this.option_toast);
          }
        }).then(() => {
         this.errors.clear();
         console.log(this.errors);
       });
      },
      showModal:function(input) {
        $('#modal-fase').modal('show');
        this.fase_a_borrar = input;
      },
      borrarFase:function() {
        this.$http.delete(window._apiURL+'fases/'+this.fase_a_borrar.id)
        .then(function(response) {
          if (response.status != '200') {
            if (Object.keys(response.body.obj).length>0) {
              this.setErrors(response.body.obj);
            }
            toastr.warning(this.message,response.body.msg,this.option_toast);
          } else {
            toastr.success(response.body.msg,'',this.option_toast);
            this.fase={};
            this.tipo_fase={};
            this.fase_select={};
            $('#modal-fase').modal('hide');
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
    }
  }
</script>
