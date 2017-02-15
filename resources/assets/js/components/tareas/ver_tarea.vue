<template>
  <div class="row">
  <section class="titulo">
    <h2>Detalle de la Tarea</h2>
  </section>
    <div class="col-md-8 col-md-offset-2">
      <div class="box box-widget tarea ver_tarea">
        <div class="box-header with-border">
          <h3 class="box-title">Información de la Tarea</h3>
        </div>
        <!-- /.box-header -->
        <form role="form" name="crear_tarea" class="crear_tarea">
          <div class="box-body col-sm-12">
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
                  <li><strong>Solicitud:</strong><span> {{tarea_info.nombre_tarea}}</span></li>

                </ul>
              </div>
              <!-- /.col -->
            </div>

            <!-- /.row -->
            <div class="row">
              <div class="col-sm-6">
                <div class="form-group required">
                 <label><strong>Prioridad</strong></label>
                 <button class="btn btn-warning btn-flat prioridad_btn" disabled>{{tarea_info.estado_prioridad.nombre}}</button>
                </div>

                 <div class="form-group">
                  <label><strong>Área Encargada:</strong></label>
                  <div>{{tarea_info.area.nombre}}</div>
                </div>

                <div class="form-group">
                  <label ><strong>Persona Encargada</strong></label>
                  <select_usuarios area="coordinador" :id_area_tarea='tarea_info.areas_id'></select_usuarios>
                </div>

                <div class="form-group">
                  <label for="tiempo_mapa_cliente"><strong>Tiempo estimado cliente</strong></label>
                  <div>{{tarea_info.tiempo_mapa_cliente}} Horas</div>
                </div>

               

              </div>

              <div class="col-sm-6">

                <div class="form-group">
                  <label><strong>Fase del Projecto</strong></label>
                  <div>{{tarea_info.planeacion_fase.nombre}}</div>
                </div>

                <div class="form-group">
                   <label><strong>Fecha de entrega al cliente</strong></label>
                  <div>{{tarea_info.fecha_entrega_cliente}}</div>
                </div>

                 <div class="form-group">
                  <label><strong>Estado de solicitud: </strong></label>
                  <select_estados tipo_estado="1"  :select="estado"></select_estados>
                </div>

                <div class="form-group">
                  <label for=""><strong>Tiempo estimado Jefe</strong></label>
                  <input type="text" placeholder="horas estimadas" class="form-control tiempo_estimado">
                </div>

              </div>
             
            </div>

            <div class="form-group required" v-bind:class="[errors_return.descripcion,{ 'has-error': errors.has('descripcion') }]">
              <label for="descripcion">Descripción</label>
              <textarea class="form-control" rows="3"  name="descripcion"  id="descripcion" v-model="tarea.descripcion" placeholder="Descripción" required="required" v-validate data-vv-rules="required|min:4"></textarea>
              <span  class="help-block" v-show="errors.has('descripcion')">{{ errors.first('descripcion') }}</span>
            </div>
            
            
          </div>
          <!-- /.box-body -->

          <div class="box-footer text-center">
            <button type="button" class="btn btn-primary" v-on:click="asignar_tarea()">Publicar</button>
          </div>
      </div>
    </div>
  </div>
</template>
<script>
import Datepicker from 'vuejs-datepicker';
import VeeValidate, { Validator } from 'vee-validate';

Vue.component('select_estados',require('../herramientas/select_estado.vue'));
Vue.component('select_usuarios',require('../herramientas/select_usuarios.vue'));

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

          //ASigno la informacion de la ot
          this.ot=obj.ot;

          //ASigno la informacion del usuario
          this.ot.usuario=obj.usuario;

          //ASigno la informacion del cliente
          this.ot.cliente=obj.cliente;

          //Asigno toda la informacion traida del api a la variable tarea_info
          this.tarea_info=obj;
          
          console.log(this.tarea_info);

    }

  },
  methods:{
     asignar_tarea:function(){
      
     }
  }
}

</script>