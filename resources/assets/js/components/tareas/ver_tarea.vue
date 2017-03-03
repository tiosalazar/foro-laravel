<template>
  <div class="row">
  <section class="titulo">
     <h3 class="box-title"><span class="span_descripcion1">Detalle de la</span> <span class="span_descripcion2">Tarea</span></h3>
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
                <div class="form-group same-height required">
                 <label><strong>Prioridad:</strong></label>
                 <button class="btn btn-warning btn-flat prioridad_btn" disabled>{{tarea_info.estado_prioridad.nombre}}</button>
                </div>

                 <div class="form-group same-height">
                  <label><strong>Área Encargada:</strong></label>
                  <div>{{tarea_info.area.nombre}}</div>
                </div>

                <div class="form-group same-height">
                  <label ><strong>Persona Encargada:</strong></label>
                  <div v-if="rol_actual==='colaborador' || rol_actual==='cuentas' || estado_solicitud.id != '3' ">
                    {{tarea_info.usuarioencargado.nombre}} - {{tarea_info.usuarioencargado.apellido}}
                  </div>
                  <div v-else>
                    <select_usuarios area="coordinador"  :id_area_tarea='tarea_info.areas_id' ></select_usuarios>
                  </div>
                </div>



                 <label for=""><strong>Fecha entrega Área:</strong></label>
                <div class="form group input-group date" v-bind:class="{ 'has-error': errors.has('fecha_entrega_area') }">

                      <div v-if="rol_actual==='colaborador' || rol_actual==='cuentas' || estado_solicitud.id == '4'|| estado_solicitud.id == '5'">
                           {{tarea_info.fecha_entrega_area | date_format}}
                        </div>
                       <div class="contenedor_fecha" v-else>

                         <div class="input-group-addon" >
                          <i class="fa fa-calendar"></i>
                        </div>

                          <datepicker  style="height:26px;" language="es"  id="fecha_entrega_area" required="required"   v-validate data-vv-rules="required" data-vv-as="Fecha Entrega Area" placeholder="Fecha Entrega Area"  :disabled="state.disabled" v-model="tarea_info.fecha_entrega_area" class="form-control"  name="fecha_entrega_area" format="dd-MM-yyyy"></datepicker>

                       </div>
                    <span  class="help-block" v-show="errors.has('fecha_entrega_area')">{{ errors.first('fecha_entrega_area') }}</span>
                </div>



              </div>

              <div class="col-sm-6 columna2">

                <div class="form-group same-height">
                  <label><strong>Fase del Projecto:</strong></label>
                  <div>{{tarea_info.planeacion_fase.nombre}}</div>
                </div>

                <div class="form-group same-height">
                   <label><strong>Fecha de entrega al cliente:</strong></label>
                  <div>{{tarea_info.fecha_entrega_cliente | date_format}}</div>
                </div>

                 <div class="form-group same-height">
                  <label><strong>Estado de solicitud: </strong></label>
                  <select_estados tipo_estado="1"  :select="tarea_info.estado"></select_estados>
                </div>


                <label for=""><strong>Fecha entrega cuentas:</strong></label>
                <div class="form group input-group date" v-bind:class="{ 'has-error': errors.has('fecha_entrega_cuentas') }">
                    <div v-if="rol_actual==='colaborador' || rol_actual==='cuentas' || estado_solicitud.id == '4'|| estado_solicitud.id == '5'">
                           {{tarea_info.fecha_entrega_cuentas | date_format}}
                    </div>
                  <div class="contenedor_fecha" v-else>
                      <div class="input-group-addon" >
                        <i class="fa fa-calendar"></i>
                      </div>

                      <datepicker   language="es"  id="fecha_entrega_cuentas" required="required"   v-validate data-vv-rules="required" data-vv-as="Fecha Entrega Area" placeholder="Fecha Entrega Cuentas"  :disabled="state.disabled" v-model="tarea_info.fecha_entrega_cuentas" class="form-control"  name="fecha_entrega_cuentas" format="dd-MM-yyyy"></datepicker>

                  </div>
                    <span  class="help-block" v-show="errors.has('fecha_entrega_cuentas')">{{ errors.first('fecha_entrega_cuentas') }}</span>
                </div>



              </div>

              <div class="col-sm-12">
                <div class="form-group ruta_server">
                  <label><strong>Ruta server:</strong></label>
                  <p>{{tarea_info.enlaces_externos}}</p>
                </div>
              </div>

            </div>
            <div class="row">
              <div class="col-sm-4">
                <div class="form-group">
                  <label for="tiempo_mapa_cliente"><strong>Tiempo estimado cliente</strong></label>
                  <div>{{tarea_info.tiempo_mapa_cliente}} Horas</div>
                </div>
              </div>

              <div class="col-sm-4">
                <div class="form-group" v-bind:class="{ 'has-error': errors.has('fecha_entrega_cuentas') }">
                  <label for=""><strong>Tiempo estimado Jefe:</strong></label>
                  <div v-if="rol_actual==='colaborador' || rol_actual==='cuentas' || estado_solicitud.id == '4'|| estado_solicitud.id == '5'">
                      {{tarea_info.tiempo_estimado}}
                  </div>
                  <div v-else>
                    <input type="number" placeholder="horas estimadas" name="horas_estimadas" class="form-control tiempo_estimado" v-model="tarea_info.tiempo_estimado" required="required">
                  </div>

                </div>
                <span  class="help-block" v-show="errors.has('fecha_entrega_cuentas')">{{ errors.first('fecha_entrega_cuentas') }}</span>
              </div>

              <div class="col-sm-4">
               <div v-if="(rol_actual==='colaborador' && tarea_info.estados_id == '3') || (rol_actual==='coordinador'  && estado_solicitud.id == '2' )">
                  <div class="form-group" v-bind:class="{ 'has-error': errors.has('timepo_real') }">
                      <label for=""><strong>Tiempo Real:</strong></label>
                      <input type="number" placeholder="Tiempo Real" name="timepo_real" class="form-control tiempo_estimado" v-model="tarea_info.tiempo_real" required="required" v-validate data-vv-rules="required">
                  </div>
              </div>
              <div v-else>
                  <div class="form-group" >
                      <label for=""><strong>Tiempo Real:</strong></label>
                      <!-- <br> -->
                      <div>{{tarea_info.tiempo_real}}</div>
                  </div>
              </div>
                <span  class="help-block" v-show="errors.has('timepo_real')">{{ errors.first('timepo_real') }}</span>
              </div>
            </div>

            <div class="form-group">
              <label><strong>Descripción de la trea:</strong></label>
              <p>{{tarea_info.descripcion}}</p>
            </div>

            <div class="form-group required" >

            <div v-bind:class="{ 'hidden': descripcion_requerida }">
            <div class="alert alert-danger alert_ups"> Ups, ¿Que sucedio? </div>
            <p class="text_alert">*Escribre que sucedió en el campo de observaciones, recuerda que es obligatorio</p>
            </div>
              <label for="descripcion">Comentario:</label>
              <textarea class="form-control" rows="3"  name="descripcion"  id="descripcion" v-model="descripcion" placeholder="Descripción" required="required"></textarea>
            </div>


          </div>
          <!-- /.box-body -->
           <div v-if=" (estado_solicitud.id==1 && rol_actual =='coordinador')" >
                <div class="box-footer text-center">
                  <button type="button" class="btn btn-primary" v-on:click="asignar_tarea()">Actualizar</button>
                </div>
           </div>
           <div v-else-if="id_usuario_actual==tarea_info.encargado_id && tarea_info.estados_id!='1'">
                 <div class="box-footer text-center">
                  <button type="button" class="btn btn-primary" v-on:click="asignar_tarea()">Actualizar</button>
                </div>
           </div>
           <div v-else>
               <div class="box-footer text-center">
                  <button type="button" class="btn btn-primary" v-on:click="enviarcomentarios()">Comentar</button>
              </div>
           </div>
       </form>
          <!-- Comentarios -->
         <div class="box box-widget comentario_box">
         <paginate
          name="comentarios_array"
          :list="comentarios_array"
          :per="5"
          class="paginate-comentarios_array"
          >
             <div v-for="comentario in paginated('comentarios_array')" style="margin-bottom:20px;margin-top:35px;">

                <div  class="comentario_box_container">
                  <div class="img_comentario">
                    <div v-if="comentario.user.img_perfil==null"><img   :src="_baseURL+'/images/perfil.jpg'" class="img_comentario_src"></div>
                    <div v-else><img   v-bind:src="_baseURL+comentario.user.img_perfil" class="img_comentario_src"></div>
                  </div>

                  <div class="info_comentarios">
                    <label><strong>{{comentario.user.nombre}} &nbsp {{comentario.user.apellido}}</strong></label>
                    <span >({{comentario.user.email}})</span>
                    <p class="comentario_created" >{{comentario.created_at}}</p>
                    <div v-if="comentario.estados!=null" class="estado_comentario">
                      <p >{{comentario.estados.nombre}}<span :class="'estado_comentario_circle estado-'+comentario.estados.tipos_estados_id+'-'+comentario.estados.id"></span></p>
                    </div>
                  </div>

                 </div>
                  <div class="caja_comentarios">
                    <p>{{comentario.comentarios}}</p>
                  </div>


               </div>
           </paginate>
           <!-- Paginacion, paginate link tiene sus propiedades del componente instalado de vue js -->
           <div class="link_paginador">
             <paginate-links for="comentarios_array" 
             :show-step-links="true"
             :step-links="{
                next: 'Siguiente',
                prev: 'Atrás'
              }" 
            :classes="{
              'ul': 'pagination',
              '.next > a': 'next-link',
              '.prev > a': ['prev-link'] 
            }" :hide-single-page="true" >
             </paginate-links>
           </div>
         </div>


      </div>
    </div>
  </div>
</template>
<script>
  import Datepicker from 'vuejs-datepicker';
  import VuePaginate from 'vue-paginate'
  import VeeValidate, { Validator } from 'vee-validate';
  import moment from 'moment';

  Vue.component('select_estados',require('../herramientas/select_estado.vue'));
  Vue.component('select_usuarios',require('../herramientas/select_usuarios.vue'));

  Vue.use(VeeValidate);
  module.exports = {
    props: ['arraytarea','id_usuario_actual','rol_usuario_actual'],
    components: {Datepicker,VeeValidate,Validator},
    data(){
      return{
        rol_actual:'',
        tarea:{
          nombre_tarea:this.arraytarea.nombre_tarea,
          enlaces_externos:this.arraytarea.enlaces_externos,
        },
        descripcion_requerida:true,
        comentarios_array:[],
        paginate: ['comentarios_array'],
        descripcion:'',
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
        usuario_actual_comentar:'',
        area:{},
        message:'',
        errors_return:{
          'nombre':'',
          'horas_estimadas':'',
          'nit':'',
          'nombre_contacto':'',
          'telefono':'',
          'email':'',
          'descripcion':'',
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
          });
          this.$on('select_estado', function(v) {
            this.estado_solicitud=v;
            //Alerta atencion cuentas, descripcion o comentario obligatorio
            if (this.estado_solicitud.nombre=="Atención Cuentas") {
            this.descripcion_requerida=false;
             }else{
              this.descripcion_requerida=true;
            }
          });
          //Recibe la propiedad arraytarea desde la vista y verifico si es indefinida o no
          if (this.arraytarea!=undefined) {
            var obj = JSON.parse(this.arraytarea);
            //Asigno la informacion de la ot
            this.ot=obj.ot;
            //Asigno toda la informacion traida del api a la variable tarea_info
            this.tarea_info=obj;
            //Asignos los comentarios para el v-for   
            this.comentarios_array=obj.comentario;
            this.comentarios_array.reverse();
          }
          //Asigno el rol actual
          this.usuario_actual_comentar= this.id_usuario_actual;
          this.rol_actual=this.rol_usuario_actual;
          this.encargado = {id:this.tarea_info.usuarioencargado.id}
          if (this.rol_actual=="colaborador") {
            this.encargado=this.tarea_info.usuarioencargado;
          }
          if (this.id_usuario_actual == this.tarea_info.encargado_id) {
            this.tarea_info.estado=0;
          }
        },
      filters: {
        date_format: function (value) {
          if (!value) return ''

          return (value)?moment(value).format('DD | MMM | YYYY'):'';
        }
      },
      methods:{
       asignar_tarea:function(){

        if (!(this.estado_solicitud.id == 4 || this.estado_solicitud.id == 5 || this.estado_solicitud.id == 7)) {
          this.$validator.validateAll();
        }
        if (this.errors.any()) {
          return false
        }
        if (this.estado_solicitud.nombre=="Atención Cuentas" && this.descripcion=="" ) {
          return false
        }

          //Datos a enviar al asignar la tarea y comentarios
          let fecha_area=(this.estado_solicitud.id == 4 || this.estado_solicitud.id == 5|| this.estado_solicitud.id == 7)?null:moment(this.tarea_info.fecha_entrega_area).format('YYYY-MM-DD');
          let fecha_cuentas=(this.estado_solicitud.id == 4 || this.estado_solicitud.id == 5|| this.estado_solicitud.id == 7)?null:moment(this.tarea_info.fecha_entrega_cuentas).format('YYYY-MM-DD');

            //Datos a enviar
            let data = 
            {
              encargado_id:this.encargado.id,
              estados_id:this.estado_solicitud.id,
              tiempo_estimado:this.tarea_info.tiempo_estimado,
              fecha_entrega_area:fecha_area,
              fecha_entrega_cuentas:fecha_cuentas,
              usuarios_comentario_id:this.id_usuario_actual,
              tareas_id:this.tarea_info.id,
              comentarios:this.descripcion,
              tiempo_real:this.tarea_info.tiempo_real,
              is_comment:(this.tarea_info.estados_id== 2 && this.rol_usuario_actual !='coordinador')? 1: 0,
            };
            
            //Método que envia los datos al api rest
            this.$http.put(window._apiURL+'tareas/'+this.tarea_info.id, data)
            .then(function (respuesta) {

              let that = this;
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
                  this.descripcion="";
                  this.comentarios_array.unshift(respuesta.body.user_coment);
                  setTimeout(function(){ that.errors.clear(); }, 50); 
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
          }).then(() => {  
           this.errors.clear();
           console.log(this.errors);
         });
        },
        enviarcomentarios:function(){
          if (this.descripcion=="") {
            this.descripcion_requerida=false;
            return false;
          }
          let data = {
            comentarios:this.descripcion,
            usuarios_comentario_id:this.id_usuario_actual,
            is_comment:1,
            tareas_id:this.tarea_info.id
          }

          this.$http.put(window._apiURL+'tareas/'+this.tarea_info.id, data)
          .then(function(respuesta){
           this.descripcion="";
           this.descripcion_requerida=true;
           this.comentarios_array.unshift(respuesta.body.user_coment);
           toastr.success(respuesta.body.msg,'',this.option_toast);
         });
        },
        updateResource(data){
          this.comentarios_array = data
        }
      }

}

</script>
