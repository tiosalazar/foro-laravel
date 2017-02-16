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
                  <li><strong>Cliente:</strong><span> {{ot.cliente.nombre}}</span></li>
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
                  <select_usuarios area="coordinador" :id_area_tarea='tarea_info.areas_id' :select="tarea_info.usuarioencargado"></select_usuarios>
                </div>

                <div class="form-group">
                  <label for="tiempo_mapa_cliente"><strong>Tiempo estimado cliente</strong></label>
                  <div>{{tarea_info.tiempo_mapa_cliente}} Horas</div>
                </div>
                
                 <label for=""><strong>Fecha entrega Área</strong></label>
                <div class="form group input-group date" v-bind:class="{ 'has-error': errors.has('fecha_entrega_area') }">
               
                    <div class="input-group-addon" >
                      <i class="fa fa-calendar"></i>
                    </div>

                    <datepicker  style="height:26px;" language="es"  id="fecha_entrega_area" required="required"   v-validate data-vv-rules="required" data-vv-as="Fecha Entrega Area" placeholder="Fecha Entrega Area"  :disabled="state.disabled" v-model="tarea_info.fecha_entrega_area" class="form-control"  name="fecha_entrega_area" format="dd-MM-yyyy"></datepicker>  
                    <span  class="help-block" v-show="errors.has('fecha_entrega_area')">{{ errors.first('fecha_entrega_area') }}</span>
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
                  <select_estados tipo_estado="1"  :select="tarea_info.estado"></select_estados>
                </div>

                <div class="form-group">
                  <label for=""><strong>Tiempo estimado Jefe</strong></label>
                  <input type="number" placeholder="horas estimadas" name="horas_estimadas" class="form-control tiempo_estimado" v-model="tarea_info.tiempo_estimado" required="required">
                </div>
                
                <label for=""><strong>Fecha entrega cuentas</strong></label>
                <div class="form group input-group date" v-bind:class="{ 'has-error': errors.has('fecha_entrega_cuentas') }">

                    <div class="input-group-addon" >
                      <i class="fa fa-calendar"></i>
                    </div>
                   
                    <datepicker   language="es"  id="fecha_entrega_cuentas" required="required"   v-validate data-vv-rules="required" data-vv-as="Fecha Entrega Area" placeholder="Fecha Entrega Cuentas"  :disabled="state.disabled" v-model="tarea_info.fecha_entrega_cuentas" class="form-control"  name="fecha_entrega_cuentas" format="dd-MM-yyyy"></datepicker>  
                    <span  class="help-block" v-show="errors.has('fecha_entrega_cuentas')">{{ errors.first('fecha_entrega_cuentas') }}</span>
                </div>

              </div>
             
            </div>

            <div class="form-group required" v-bind:class="[errors_return.descripcion,{ 'has-error': errors.has('descripcion') }]">
              <label for="descripcion">Descripción</label>
              <textarea class="form-control" rows="3"  name="descripcion"  id="descripcion" v-model="tarea_info.descripcion" placeholder="Descripción" required="required" v-validate data-vv-rules="required|min:4"></textarea>
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
import moment from 'moment';

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
          enlaces_externos:this.arraytarea.enlaces_externos,
        },
        fecha_entrega_area:'',
        select_ot:this.arraytarea.ot,
        prioridad:'',
        estado:this.arraytarea.estado,
        estado_solicitud:'',
        encargado:'',
        fase:'',
        horas_estimadas:'',
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
        message:'',
        errors_return:{
              'nombre':'',
              'horas_estimadas':'',
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
             state: {
              disabled: {
                to: new Date(), // Disable all dates up to specific date
                //  from: new Date(2017,5,2), // Disable all dates after specific date
                days: [0] // Disable Saturday's and Sunday's
              }
            }
      }
       
    },
    created: function() {

      this.$on('select_ejecutivo', function(v) {
        this.encargado=v;
        console.log(this.encargado);
      });

       this.$on('select_estado', function(v) {
        this.estado_solicitud=v;
        console.log(this.estado_solicitud);
      });

      //Recibe la propiedad arraytarea desde la vista y verifico si es indefinida o no
      if (this.arraytarea!=undefined) {  
          var obj = JSON.parse(this.arraytarea);

          //ASigno la informacion de la ot
          this.ot=obj.ot;

          //ASigno la informacion del usuario
          this.ot.usuario=obj.usuario;

          //ASigno la informacion del cliente
          this.ot.cliente=obj.ot.cliente;

          //Asigno toda la informacion traida del api a la variable tarea_info
          this.tarea_info=obj;
          console.log( this.tarea_info);


    }

  },
  methods:{
     asignar_tarea:function(){
        var id_tarea= this.tarea_info.id;
        var id_encargado=this.encargado.id;
        var estado= this.estado_solicitud.id;
        var horas_estimadas=this.tarea_info.tiempo_estimado;
        var descripcion_tarea=this.descripcion;
        var fecha_area=moment(this.tarea_info.fecha_entrega_area).format('YYYY-MM-DD');
        var fecha_cuentas=moment(this.tarea_info.fecha_entrega_cuentas).format('YYYY-MM-DD');

        this.$http.put('/api/v1/tareas/'+id_tarea, {encargado_id:id_encargado,estados_id:estado,tiempo_estimado:horas_estimadas,descripcion:descripcion_tarea,fecha_entrega_area:fecha_area,fecha_entrega_cuentas:fecha_cuentas})
        .then(function (respuesta) {

            var that = this;
            that.message ='';

           if (respuesta.status != '200') {
              if (Object.keys(respuesta.body.request).length>0) {

                $.each(respuesta.body.request, function(index, value) {
                  that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
                  that.errors_return[index] = 'has-warning';
                });
              }

              toastr.warning(that.message,respuesta.body.msg,this.option_toast);
            }else{
                  if (respuesta.body.error == 0) {
                      toastr.success(respuesta.body.msg,'',this.option_toast);
                      
                    }else{
                        $.each(respuesta.body.obj, function(index, value) {
                          that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
                          that.errors_return[index] = 'has-warning';
                        });
                        if (respuesta.body.request.fecha_entrega_area=="Invalid date") {
                           toastr.error(that.message,"Fecha area "+respuesta.body.request.fecha_entrega_area,this.option_toast);
                        }

                         if (respuesta.body.request.fecha_entrega_cuentas=="Invalid date") {
                            toastr.error(that.message,"Fecha cuentas "+respuesta.body.request.fecha_entrega_cuentas,this.option_toast);
                        }

                        toastr.error(that.message,respuesta.body.msg,this.option_toast);
                     
                     
                    }
            }
          console.log(respuesta);
        });
     }
  }

}

</script>