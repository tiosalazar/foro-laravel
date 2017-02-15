<template>
  <div class="row">
  <section class="titulo">
    <h2>Detalle de la Tarea</h2>
  </section>
    <div class="col-md-8 col-md-offset-2">
      <div class="box box-widget tarea">
        <div class="box-header with-border">
          <h3 class="box-title">Información de la Tarea</h3>
        </div>
        <!-- /.box-header -->
        <form role="form" name="crear_tarea" class="crear_tarea">
          <div class="box-body col-sm-12">
            <div class="form-group required">
              <label for="ot">Nombre el Projecto <sup>*</sup></label>
              <select_ot :select="select_ot"></select_ot>
            </div>
            <div class="row desc-ot with-border">
              <div class="col-sm-6 border-right">
                <ul>
                  <li><strong>Numero de OT:</strong><span> #{{ot.referencia}}</span></li>
                  <li><strong>Ejecutivo:</strong><span> {{ot.usuario.nombre}}</span></li>
                  <li><strong>Fecha de Solicitud:</strong><span> {{tarea_info.created_at}}</span></li>
                </ul>
              </div>
              <div class="col-sm-6">
                <ul>
                  <li><strong>Proyecto:</strong><span> {{ot.nombre}}</span></li>
                  <li><strong>Cliente:</strong><span> {{ot.nombre_cli}}</span></li>
                </ul>
              </div>
              <!-- /.col -->
            </div>
            <!-- /.row -->
            <div class="row">
              <div class="col-sm-2">
                <div class="form-group required">
                  <label>Prioridad <sup>*</sup></label>
                  <select_prioridad :select="prioridad"></select_prioridad>
                </div>
              </div>
              <div class="col-sm-6">
                <div class="form-group required">
                  <label>Fase del Projecto <sup>*</sup></label>
                  <select_fase :select="fase"></select_fase>
                </div>
              </div>
              <div class="col-sm-4">
                <div class="form-group required">
                  <label>Área <sup>*</sup></label>
                  <select_area  :refresha="refresh"></select_area>
                </div>
              </div>
            </div>
            
            
            <div class="row">
              <div class="col-sm-4">
                <label>Fecha entrega cliente</label>
                <div class="input-group date" >
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <datepicker language="es"  id="fecha_entrega_cliente" required="required" placeholder="Fecha fin" v-model="fecha_entrega_cliente" class="form-control" :disabled="disabled"  name="fecha_entrega_cliente" format="dd-MM-yyyy"></datepicker>
                </div>
              </div>
              <div class="col-sm-8">
                <div class="form-group required" v-bind:class="[errors_return.nombre_tarea,{ 'has-error': errors.has('nombre_tarea') }]">
                  <label for="nombre_tarea">Nombre de la Solicitud <sup>*</sup></label>
                  <input type="text" class="form-control"  id="nombre_tarea" v-model="tarea.nombre_tarea" name="nombre_tarea" placeholder="Solicitud" v-validate data-vv-rules="required|min:4" required="required">
                  <span  class="help-block" v-show="errors.has('nombre_tarea')">{{ errors.first('nombre_tarea') }}</span>
                </div>
              </div>
            </div>
            
            <div class="form-group" v-bind:class="[errors_return.enlaces_externos,{ 'has-error': errors.has('enlaces_externos') }]">
              <label for="enlaces_externos">Ruta del server</label>
              <!-- <textarea class="form-control" rows="3" name="enlaces_externos"  id="enlaces_externos" v-model="tarea.enlaces_externos" placeholder="Ruta del server" v-validate data-vv-rules="required|min:4"></textarea> -->
              <textarea class="form-control" rows="3" name="enlaces_externos"  id="enlaces_externos" v-model="tarea.enlaces_externos" placeholder="Ruta del server"></textarea>
              <!-- <span  class="help-block" v-show="errors.has('enlaces_externos')">{{ errors.first('enlaces_externos') }}</span> -->
            </div>

            
            <div class="row">
              <div class="col-sm-6">
                <div class="form-group required">
                  <label>Estado <sup>*</sup></label>
                  <select_estados tipo_estado="1"  :select="estado"></select_estados>
                </div>
              </div>
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="tiempo_mapa_cliente">Tiempo estimado mapa del cliente</label>
                  <input type="text" name="tiempo_mapa_cliente" id="tiempo_mapa_cliente" v-model="tarea.tiempo_mapa_cliente" class="form-control" placeholder="Tiempo mapa del cliente">
                </div>
              </div>
            </div>
            <div class="form-group required" v-bind:class="[errors_return.descripcion,{ 'has-error': errors.has('descripcion') }]">
              <label for="descripcion">Descripción <sup>*</sup></label>
              <textarea class="form-control" rows="3"  name="descripcion"  id="descripcion" v-model="tarea.descripcion" placeholder="Descripción" required="required" v-validate data-vv-rules="required|min:4"></textarea>
              <span  class="help-block" v-show="errors.has('descripcion')">{{ errors.first('descripcion') }}</span>
            </div>
            
            
          </div>
          <!-- /.box-body -->

          <div class="box-footer text-center">
            <button type="button" class="btn btn-primary" v-on:click="agregarTarea()">Publicar</button>
          </div>
      </div>
    </div>
  </div>
</template>
<script>
import Datepicker from 'vuejs-datepicker';
import VeeValidate, { Validator } from 'vee-validate';

Vue.component('select_estados',require('../herramientas/select_estado.vue'));
Vue.component('select_area',require('../herramientas/select_area.vue'));
Vue.component('select_fase',require('../herramientas/select_fase.vue'));
Vue.component('select_prioridad',require('../herramientas/select_prioridad.vue'));
Vue.component('select_ot',require('../herramientas/select_ot.vue'));
Vue.component('select_area',require('../herramientas/select_area.vue'));
Vue.component('select_rol',require('../herramientas/select_rol.vue'));

  Vue.use(VeeValidate);
	module.exports = {
    props: ['arraytarea'],
    components: {Datepicker,VeeValidate,Validator},
    data(){
      return{
        tarea:{
          nombre_tarea:this.arraytarea.nombre_tarea,
          descripcion:this.arraytarea.descripcion,
          enlaces_externos:this.arraytarea.enlaces_externos,

        },
        select_ot:this.arraytarea.ot,
        prioridad:'',
        estado:this.arraytarea.estado,
        fase:'',
        ot:{
          usuario:{
            nombre:''
          },
          cliente:{
            nombre:''
          }
        },
        tarea_info:{},
        area:{},
        current_date:this.arraytarea.created_at,
        refresh:'',
        user:'',
        fecha_entrega_cliente:this.arraytarea.fecha_entrega_cliente,
        message:'',
        disabled:{
          "to": new Date(),
        },
        errors_return:{
              'nombre':'',
              'nit':'',
              'nombre_contacto':'',
              'telefono':'',
              'email':'',
            },
            option_toast:{
              timeOut: 5000,
              "positionClass": "toast-top-center",
              "closeButton": true,
            },
      }
    },
    created: function() {

      //Recibe la propiedad arraytarea desde la vista y verifico si es indefinida o no
      if (this.arraytarea!=undefined) {  
          var obj = JSON.parse(this.arraytarea);
          this.ot=obj.ot;
          this.ot.usuario=obj.usuario;
          this.ot.cliente=obj.cliente;
          this.tarea_info=obj;
          console.log(this.arraytarea);
          console.log(this.tarea_info);

    }

  }
}

</script>