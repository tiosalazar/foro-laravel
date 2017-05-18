<template>
  <div class="row">
  <section class="titulo">

     <h3 class="box-title go-back">
       <button type="button" name="back-btn" class="btn btn-primary btn-flat btn-back" onclick="history.go(-1);">
         <i class="fa fa-chevron-left" aria-hidden="true"></i>
         &nbsp;Atrás
       </button>
       <span class="span_descripcion1">

                Detalle de la</span> <span class="span_descripcion2">Tarea</span>
     </h3>
  </section>
    <div class="col-md-8 col-md-offset-2">
      <div class="box box-widget tarea ver_tarea">
        <div class="box-header with-border">
          <h3 class="box-title">Información de la Tarea</h3>
        </div>
        <!-- /.box-header -->
        <form role="form" name="crear_tarea" class="crear_tarea">
          <div class="box-body col-md-12" >
            <div class="row desc-ot with-border">
              <div class="col-sm-6 border-right">
                <ul>
                  <li><strong>Numero de OT:</strong><span> #{{ot.referencia}}</span></li>
                  <li><strong>Ejecutivo:</strong><span> {{ot.usuario.nombre}} {{ot.usuario.apellido}}</span></li>
                  <li><strong>Fecha de Solicitud:</strong><span> {{tarea_info.created_at}}</span></li>
                </ul>
              </div>
              <div class="col-sm-6">
                <ul>
                  <li><strong>Proyecto:</strong><span> {{ot.nombre}}</span></li>
                  <li><strong>Cliente:</strong><span> {{ot.cliente.nombre}}</span></li>
                  <li><strong>Solicitud:</strong><span class="descripcion_tarea"> {{tarea_info.nombre_tarea}}</span></li>

                </ul>
              </div>
              <!-- /.col -->
            </div>
            <!-- /.row -->
            <div class="row">
      				<div class="" v-if="tarea_info.recurrente=='1'">
      					<div class="col-md-6">
                  <label><strong>Fecha inicio de recurrencia</strong></label>
      						<div class="" v-if="rol_actual==='owner' || rol_actual==='desarrollo' || id_usuario_actual == tarea_info.usuarios_id">
        						<div class="input-group date" >
        							<div class="input-group-addon">
        								<i class="fa fa-calendar"></i>
        							</div>
        							<datepicker language="es"  id="fecha_entrega_cliente" required="required" placeholder="Fecha fin" v-model="tarea_info.fecha_inicio_recurrencia" class="form-control" :disabled="disabled"  name="fecha_entrega_cliente" format="dd-MM-yyyy"></datepicker>
        						</div>
      						</div>
                  <div class="" v-else>
                    <center>{{tarea_info.fecha_inicio_recurrencia| date_format}}</center>
                  </div>
                  <br>
      					</div>
      					<div class="col-md-6">
      						<label><strong>Fecha final de recurrencia</strong></label>
                  <div class="" v-if="rol_actual==='owner' || rol_actual==='desarrollo' || id_usuario_actual == tarea_info.usuarios_id">
        						<div class="input-group date" >
        							<div class="input-group-addon">
        								<i class="fa fa-calendar"></i>
        							</div>
        							<datepicker language="es"  id="fecha_entrega_cliente" required="required" placeholder="Fecha fin" v-model="tarea_info.fecha_final_recurrencia" class="form-control" :disabled="disabled"  name="fecha_entrega_cliente" format="dd-MM-yyyy"></datepicker>
        						</div>
      						</div>
                  <div class="" v-else>
                    <center>{{tarea_info.fecha_final_recurrencia| date_format}}</center>
                  </div>
      					</div>
      				</div>
      			</div>
            <!-- /.row -->
            <div class="row">
              <div class="col-sm-6">
                <div class="form-group same-height required">
                 <label><strong>Prioridad:</strong></label>
                 <button class="btn btn-flat prioridad_btn" v-bind:class="'label label-estado estado-'+[tarea_info.estado_prioridad.tipos_estados_id]+'-'+[tarea_info.estado_prioridad.id]" disabled>{{tarea_info.estado_prioridad.nombre}}</button>
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

                      <div v-if="rol_actual==='colaborador' || rol_actual==='cuentas' || estado_solicitud.id != '3'">
                           {{tarea_info.fecha_entrega_area | date_format}}
                        </div>
                       <div class="contenedor_fecha" v-else>

                         <div class="input-group-addon" >
                          <i class="fa fa-calendar"></i>
                        </div>

                          <datepicker  style="height:26px;" language="es"  id="fecha_entrega_area" required="required"   v-validate data-vv-rules="required" data-vv-as="Fecha Entrega Área" placeholder="Fecha Entrega Area" @input="guardarDatos"  :disabled="state.disabled" v-model="tarea_info.fecha_entrega_area" class="form-control"  name="fecha_entrega_area" format="dd-MM-yyyy"></datepicker>

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
                   <div class="contenedor_fecha">
                     {{tarea_info.fecha_entrega_cliente | date_format}}
                   </div>
                   <br>
                   <div v-if="rol_actual=='owner' || rol_actual=='desarrollo'">

                     <div class="input-group date" >
                       <div class="input-group-addon">
                         <i class="fa fa-calendar"></i>
                       </div>
                       <datepicker language="es"  id="fecha_entrega_cliente" required="required" placeholder="Fecha fin" v-model="fecha_entrega_cliente" class="form-control" :disabled="disabled"  name="fecha_entrega_cliente" format="dd-MM-yyyy"></datepicker>
                     </div>
                     </div>


                  <!-- <div>{{tarea_info.fecha_entrega_cliente | date_format}}</div> -->
                </div>


                 <div class="form-group same-height">
                  <label><strong>Estado de solicitud: </strong></label>
                  <!-- <div class="" v-if=" rol_actual !='coordinador' &&  rol_actual!='owner' && (id_usuario_actual != tarea_info.encargado_id && tarea_info.estados_id == '1')"> -->
                  <div class="" v-if="(rol_actual =='owner' && tarea_info.estados_id != '1' )
                                      || (rol_actual =='desarrollo' && tarea_info.estados_id != '1')
                                      || (rol_actual =='cuentas' && tarea_info.estados_id==6)
                                      || (rol_actual =='cuentas' && tarea_info.estados_id==20)
                                      || (id_usuario_actual == tarea_info.encargado_id && tarea_info.estados_id != '1' && tarea_info.estados_id != '2' && tarea_info.estados_id != '20' )
                                      || (rol_actual =='coordinador' && tarea_info.estados_id == '2')
                                      || (rol_actual =='coordinador' && tarea_info.estados_id == '20')">
                    <select_estados tipo_estado="1"  :select="tarea_info.estado"></select_estados>
                  </div>
                  <div v-else>
                    <span v-bind:class="'label label-estado estado-'+[estado.tipos_estados_id]+'-'+[estado.id]">{{estado.nombre}}</span>

                  </div>
                </div>




                <label for=""><strong>Fecha entrega cuentas:</strong></label>
                <div class="form group input-group date" v-bind:class="{ 'has-error': errors.has('fecha_entrega_cuentas') }">
                    <div v-if="rol_actual==='colaborador' || rol_actual==='cuentas' || estado_solicitud.id != '3'">
                           {{tarea_info.fecha_entrega_cuentas | date_format}}
                    </div>
                  <div class="contenedor_fecha" v-else>
                      <div class="input-group-addon" >
                        <i class="fa fa-calendar"></i>
                      </div>

                      <datepicker   language="es"  id="fecha_entrega_cuentas" required="required"   v-validate data-vv-rules="required" data-vv-as="Fecha Entrega Area" placeholder="Fecha Entrega Cuentas"   :disabled="state.disabled_cuentas" v-model="tarea_info.fecha_entrega_cuentas" class="form-control"  name="fecha_entrega_cuentas" format="dd-MM-yyyy"></datepicker>

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
                  <div v-show="tarea_info.tiempo_mapa_cliente">{{tarea_info.tiempo_mapa_cliente}} Horas</div>
                </div>
              </div>

              <div class="col-sm-4">
                <div class="form-group" v-bind:class="{ 'has-error': errors.has('fecha_entrega_cuentas') }">
                  <label for=""><strong>Tiempo estimado Jefe:</strong></label>
                  <div v-if="rol_actual==='colaborador' || rol_actual==='cuentas' || estado_solicitud.id != '3' ">
                      {{tarea_info.tiempo_estimado}} Horas
                  </div>
                  <div v-else>
                    <input type="text" placeholder="horas estimadas" name="horas_estimadas" class="form-control tiempo_estimado" v-model="tarea_info.tiempo_estimado" required="required|numeric">
                  </div>

                </div>
                <span  class="help-block" v-show="errors.has('fecha_entrega_cuentas')">{{ errors.first('fecha_entrega_cuentas') }}</span>
              </div>

              <div class="col-sm-4">
               <div v-if="(rol_actual==='colaborador' && tarea_info.estados_id == '3') || (rol_actual==='coordinador'  && estado_solicitud.id == '2' ) || (rol_actual==='desarrollo'  && estado_solicitud.id == '2' )">
                  <div class="form-group" v-bind:class="{ 'has-error': errors.has('tiempo_real') }">
                      <label for=""><strong>Tiempo Real:</strong></label>
                      <input type="text" placeholder="Tiempo Real" name="tiempo_real" class="form-control tiempo_estimado" v-model="tarea_info.tiempo_real" required="required" v-validate data-vv-rules="required|decimal">
                      <span  class="help-block" v-show="errors.has('tiempo_real')">{{ errors.first('tiempo_real') }}</span>
                  </div>
              </div>
              <div v-else>
                  <div class="form-group" >
                      <label for=""><strong>Tiempo Real:</strong></label>
                      <!-- <br> -->
                      <div>{{tarea_info.tiempo_real}} Horas</div>
                  </div>
              </div>
              </div>
            </div>

            <div class="form-group">
              <label><strong >Descripción de la tarea :</strong></label>
              <p class="descripcion_tarea" v-html="tarea_info.descripcion"></p>
            </div>

            <div id="seccion_programar" v-if="rol_actual==='coordinador' && estado_solicitud.id == '3' ">
            <div class="clearfix"></div>
            <!-- Mensaje de atención -->
            <div class="box">
              <div class="box-header with-border bg-aqua-active">
                <h3 class="box-title bg-aqua-active"><b>Nueva Funcionalidad</b></h3>

                <div class="box-tools pull-right ">

                  <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Cerrar">
                    <i class="fa fa-times" style="color:white;"></i></button>
                  </div>
                  <div>Ya puedes programar directamente en <b> Google Calendar</b>, elije la fecha de inico y final para continuar. Si son dos jornadas o más puedes dar click en <b>Añadir Nuevo</b> y agregar las jornadas que desees.</div>
                </div>

              </div>
            <div class="box box-info  collapsed-box">
              <div class="box-header box-primary">
                <h3 class="box-title">  <label for="ot">Programar en Calendar</label></h3>
                <div class="box-tools">
                  <button type="button" class="btn btn-box-tool btn-info" data-widget="collapse"><i class="fa fa-minus"></i></button>
                </div>
              </div>
            <div class="box-body">
          <section  v-for="(ed,index) in datos_fechas">
            <div class="same-height col-md-6 col-sm-6 col-xs-12">
                <div style="height:12px"></div>
                <label for=""><strong>Fecha y Hora de inicio:</strong></label>
                <div class="form group input-group date"  v-bind:class="{ 'has-error': errors.has('inicio_programada'+index) }">
                  <div class="contenedor_fecha">
                      <div class="input-group-addon" >
                        <i class="fa fa-calendar"></i>
                    </div>
                    <date-picker   :name="'inicio_programada'+index" :option="timeoption"   @change="CalcularDatos(index)"  :date="ed.inicio_programada" :id="'inicio_programada'+index" ></date-picker>
                  </div>
                </div>
              </div>
             <div class="same-height  col-md-6  col-sm-6 col-xs-12">
                <div style="height:12px"></div>
                <label for=""><strong>Fecha y Hora final:</strong></label>
                <div class="form group input-group date"  v-bind:class="{ 'has-error': errors.has('fin_programada'+index) }" >
                  <div class="contenedor_fecha">
                      <div class="input-group-addon" >
                        <i class="fa fa-calendar"></i>
                    </div>
                     <date-picker  :name="'fin_programada'+index"   :option="timeoption"   @change="CalcularDatos(index)"  :date="ed.fin_programada" :id="'fin_programada'+index" ></date-picker>
                  </div>
                </div>
              </div>
              <div class="col-md-12  same-height with-border ">
                <div class="form-group col-md-6  col-sm-6 col-xs-12">
                 <label><strong>Tiempo Programado:</strong></label>
                 <div> {{ed.h_programada}}</div>
               </div>
               <div class="col-md-6  col-sm-6 col-xs-12" ><!--v-show="$parent.visualizacion != 'true'" -->
                   <button type="button" @click="deleteEvento" class="btn btn-danger boton_foro error">Eliminar</button>
               </div>

              </div>
              </section>

              <div class="same-height  col-md-6  col-sm-6 col-xs-12" ><!--v-show="$parent.visualizacion != 'true'" -->
                  <div style="height:22px"></div>
                  <button type="button" @click="addEvento" class="btn btn-block btn-success boton_foro add_req">Añadir nuevo</button>
              </div>
            </div>
          </div>



          </div>

            <div class="form-group required" >

            <div v-bind:class="{ 'hidden': descripcion_requerida }">
            <div class="alert alert-danger alert_ups"> Ups, ¿Que sucedio? </div>
            <p class="text_alert">*Escribre que sucedió en el campo de observaciones, recuerda que es obligatorio</p>
            </div>
              <label for="descripcion">Comentario:</label>

              <vue-html5-editor :content="descripcion_fake" :height="150"  :z-index="0" @change="updateData"></vue-html5-editor>

            </div>

          </div>

          <!-- /.box-body -->
          <div v-if=" (rol_actual =='owner') || (rol_actual =='desarrollo') || (rol_actual =='cuentas' && tarea_info.estados_id==20)" >
                <div class="box-footer text-center">
                  <button type="button" class="btn btn-primary" v-on:click="asignar_tarea()">Actualizar</button>
                  <button type="button" class="btn btn-primary" v-on:click="enviarcomentarios()">Comentar</button>
                </div>
           </div>
           <div v-else-if=" ((estado_solicitud.id==1 || estado_solicitud.id==2 || estado_solicitud.id==3 || estado_solicitud.id==20 || tarea_info.estados_id==20) && rol_actual =='coordinador' )|| (rol_actual =='cuentas' && tarea_info.estados_id==6)"  >
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
                    <p v-html="comentario.comentarios"></p>
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
<style>
 .cov-date-caption{
   padding: 7px 0!important;
 }
 .cov-date-caption[_v-d2b48680]{
      padding: 7px 0!important;
      margin: -35px 0px !important;
 }
 .cov-date-monthly  div[_v-d2b48680] {
    height: 115px !important;
}
.cov-date-monthly{
   height: 100px !important;
}
.checked,.active {
    background: rgb(0, 46, 96) !important;
}
.cov-date-caption span[_v-d2b48680]:hover {
    color: rgb(21, 172, 202)  !important;
}
.hour-item[_v-d2b48680], .min-item[_v-d2b48680] {
    padding: 0px!important;
    font-size: 30px!important;
}
.hour-box:before {
    content: 'Horas';
    background: rgb(21, 172, 202);
    color: white;
    width: 50%;
    position: absolute;
        border-right: 1px solid #c1c1c1;
    left: 0px;
    top: 20%;
    font-size: 20px;
}
.min-box:before {
    content: 'Minutos';
    background: rgb(21, 172, 202);
    color: white;
    width: 50%;
    position: absolute;
    right: 0px;
    border-left: 1px solid #c1c1c1;
    top: 20%;
    font-size: 20px;
}
</style>
<script>
  import Datepicker from 'vuejs-datepicker';
  import VuePaginate from 'vue-paginate';
  import VeeValidate, { Validator } from 'vee-validate';
  import moment from 'moment';
  import VueHtml5Editor from 'vue-html5-editor';
  import myDatepicker from 'vue-datepicker'
    Vue.use(VueHtml5Editor);

  Vue.component('select_estados',require('../herramientas/select_estado.vue'));
  Vue.component('select_usuarios',require('../herramientas/select_usuarios.vue'));

  Vue.use(VeeValidate);
  module.exports = {
    props: ['arraytarea','id_usuario_actual','rol_usuario_actual','destarea'],
    components: {Datepicker,VeeValidate,Validator,'date-picker': myDatepicker},
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
        // Variable vacia para el textarea, ya que es requerido un valor inicial
        descripcion_fake:'',
        fecha_entrega_area:'',
        select_ot:this.arraytarea.ot,
        prioridad:'',
        estado:'',
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
        datos_fechas:[
          {
            inicio_programada: {
              time:  moment().format('YYYY-MM-DD HH:mm')
            },
            fin_programada: {
              time: ''
            },
            h_programada:0
          }
        ],
        tarea_info:{
        },
        timeoption: {
      type: 'min',
      inputStyle: {
         'display': 'inline-block',
         'padding': '6px',
         'line-height': '22px',
         'font-size': '16px',
         'color': '#000',
       },
       color: {
         checked: '#002E60',
         header: '#002E60',
         headerText: '#fff'
       },
       placeholder:'Elija fecha y hora para continuar',
       buttons: {
         ok: 'Ok',
         cancel: 'Cancel'
       },
      week: ['Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá', 'Do'],
      month: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'DIciembre'],
      format: 'YYYY-MM-DD HH:mm'
    },
        usuario_actual_comentar:'',
        area:{},
        message:'',
        fecha_entrega_cliente:'',
        disabled:{
				  "to": moment().subtract(1, 'days').toDate(),
				},
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
            to: moment().subtract(1, 'days').toDate(), // Disable all dates up to specific date
            days: [0] // Disable Saturday's and Sunday's
          },
          disabled_cuentas: {
            to: moment().subtract(1, 'days').toDate(), // Disable all dates up to specific date
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
            this.tarea_info.estado = v;
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

            this.tarea_info.descripcion=this.destarea;

        /*
            // Editar Fechas Google Calendar
            var fechas_inicio= obj.fecha_inicio_programar;
            var fechas_fin= obj.fecha_fin_programar;
            console.log(fechas_fin,'fechas_fin');

            for (let f in fechas_inicio) {
              let idx = Number(f)
              let fecha_inicio = fechas_inicio[idx];
              let fecha_fin = fechas_fin[idx];
            console.log(fecha_inicio,'fechas_fin 2');
                var temp=[
                {
                  inicio_programada: {
                    time: moment(fecha_inicio).format('YYYY-MM-DD HH:mm')
                  },
                  fin_programada: {
                    time: moment(fecha_fin).format('YYYY-MM-DD HH:mm')
                  },
                  h_programada: (moment(fecha_inicio).isAfter(fecha_fin))?'La fecha de inicio debe de ser mayor que la incial':moment.duration( fecha_fin - fecha_inicio).humanize()
                }
              ];

                  this.datos_fechas.push(temp);
            }

            console.log(obj,'obj');*/

            this.estado = obj.estado;
            //Asignos los comentarios para el v-for
            // this.comentarios_array=obj.comentario;
            // this.comentarios_array=this.comentarios;
            // console.log(this.comentarios);
            // this.comentarios_array.reverse();
          }
          //Asigno el rol actual
          this.usuario_actual_comentar= this.id_usuario_actual;
          this.rol_actual=this.rol_usuario_actual;
          this.encargado = {id:this.tarea_info.usuarioencargado.id}
          if (this.rol_actual=="colaborador") {
            this.encargado=this.tarea_info.usuarioencargado;
          }
          if (this.id_usuario_actual == this.tarea_info.encargado_id) {
            this.tarea_info.estado="";
          }
          this.setComments();
        },

      filters: {
        date_format: function (value) {
          if (!value) return ''

          return (value)?moment(value).format('DD | MMM | YYYY'):'';
        }
      },
      methods:{
        setComments:function () {
          this.$http.get(window._baseURL+'/comentarios/'+this.tarea_info.id)
          .then(function(respuesta){
            this.comentarios_array=respuesta.body;
            console.log('comentarios',this.comentarios_array);
            this.comentarios_array.reverse();
          });
          },

        CalcularDatos:function (index) {
          let fecha_inicio = moment(this.datos_fechas[index].inicio_programada.time, "YYYY-MM-DD HH:mm:ss");
          let fecha_final = moment(this.datos_fechas[index].fin_programada.time, "YYYY-MM-DD HH:mm:ss");

          this.datos_fechas[index].h_programada = (moment(fecha_inicio).isAfter(fecha_final))?'La fecha de inicio debe de ser mayor que la incial':moment.duration( fecha_final - fecha_inicio).humanize();
        },
        /*
        Al darle click en añadir evento la función valida la información y añade una nueva posición al
        arreglo de requerimientos
        */
        addEvento: function(e) {
          e.preventDefault();
          if (this.comprobarFechas(this.datos_fechas)) {
            var temp ={inicio_programada: {time: ''},fin_programada: {time: ''},  h_programada:0};
                this.datos_fechas.push(temp);
              }
        },
        comprobarFechas: function (arreglo) {
          if( arreglo != null && arreglo != undefined ){
        		var index = Object.keys(arreglo).length;
        	}
        	if ( index == 0) {
        		toastr.error("Todos los campos son obligatorios","Error al Guardar Fechas programación",this.option_toast);
        		return false;
        	}
            for (let f in arreglo) {
              let idx = Number(f)
              let p = arreglo[idx]
               if (p.inicio_programada.time =="" || p.fin_programada.time =="") {
                 toastr.error("Recuerde que todos los campos son obligatorios, no puede dejar campos en blanco","Error en Fechas programación",this.option_toast);
             		 return false;
               }else if(moment(p.inicio_programada.time).isAfter(p.fin_programada.time)){
                 toastr.error("La fecha final debe de ser mayor que la inicial","Error en Fechas programación",this.option_toast);
                 return false;
             	}
            }
            return true;
        },
        comprobarSiGuardoFechas: function (arreglo) {
          if( arreglo != null && arreglo != undefined ){
            var index = Object.keys(arreglo).length;
          }
          if ( index == 0 || (arreglo[0].inicio_programada.time=="" || arreglo[0].fin_programada.time=="") ){
            return true;
          }else{
            this.comprobarFechas(arreglo);
            for (let f in arreglo) {
              let idx = Number(f)
              let p = arreglo[idx]
              p.inicio_programada.time = (moment(p.inicio_programada.time).isValid())?moment(p.inicio_programada.time).format('YYYY-MM-DDTHH:mm:ss'):null;
              p.fin_programada.time = (moment(p.fin_programada.time).isValid())?moment(p.fin_programada.time).format('YYYY-MM-DDTHH:mm:ss'):null;
            }
            return arreglo;
          }
        },
        /*
        Función la cual se encarga de borrar un requerimiento, lo que hace es que
        busca el indece el cual se toco y se procede a eliminar del arreglo de
        requerimientos
        */
        deleteEvento: function(e) {
          e.preventDefault();
          var index =  this.datos_fechas.indexOf(this.datos_fechas);
              this.datos_fechas.splice(index, 1);
          //Realizar el Calculo de las horas.
        },
        setErrors:function(object) {
  		        this.message='';
  		        let that = this;
  		        $.each(object, function(index, value) {
  							let campo = index.replace(/_id/g, '');
  							campo = campo.replace(/_/g, ' ');
  							value = value[0].replace(/ id /g, '');
  							that.message += '<strong>'+campo + '</strong>: '+value+ '</br>';
  		          that.errors_return[index] = 'has-warning';
  		        });
  		    },
          updateData: function (data) {
                // sync content to component
                this.descripcion = data;

            },
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
          fecha_area=(moment(fecha_area).isValid())?moment(this.tarea_info.fecha_entrega_area).format('YYYY-MM-DD'):null;
          let fecha_cuentas=(this.estado_solicitud.id == 4 || this.estado_solicitud.id == 5|| this.estado_solicitud.id == 7)?null:moment(this.tarea_info.fecha_entrega_cuentas).format('YYYY-MM-DD');
          fecha_cuentas=(moment(fecha_cuentas).isValid())?moment(this.tarea_info.fecha_entrega_cuentas).format('YYYY-MM-DD'):null;
          let recurrencia_init = (moment(this.tarea_info.fecha_inicio_recurrencia).isValid())?moment(this.tarea_info.fecha_inicio_recurrencia).format('YYYY-MM-DD HH:mm:ss'):null;
          let recurrencia_final = (moment(this.tarea_info.fecha_inicio_recurrencia).isValid())?moment(this.tarea_info.fecha_final_recurrencia).format('YYYY-MM-DD HH:mm:ss'):null;

          let data_fechas =(this.comprobarSiGuardoFechas(this.datos_fechas)===true)?null:this.comprobarSiGuardoFechas(this.datos_fechas);
          console.log(data_fechas);
            //Datos a enviar
            let data =
            {
              encargado_id:this.encargado.id,
              estados_id:this.estado_solicitud.id,
              fecha_inicio_recurrencia:recurrencia_init,
              fecha_final_recurrencia:recurrencia_final,
              fecha_entrega_area:fecha_area,
              fecha_entrega_cuentas:fecha_cuentas,
              usuarios_comentario_id:this.id_usuario_actual,
              tiempo_estimado:this.tarea_info.tiempo_estimado,
              datos_fechas:data_fechas,
              tareas_id:this.tarea_info.id,
              comentarios:this.descripcion,
              tiempo_real:this.tarea_info.tiempo_real,
              // is_comment:(this.tarea_info.estados_id== 2 && this.rol_usuario_actual !='coordinador')? 1: 0,
              is_comment:(this.tarea_info.estados_id== 2 && this.rol_usuario_actual !='coordinador')? 1: 0,
              fecha_entrega_cliente:(typeof(this.fecha_entrega_cliente) =='undefined' || this.fecha_entrega_cliente=='' )? this.tarea_info.fecha_entrega_cliente : moment(this.fecha_entrega_cliente).format('YYYY-MM-DD'),
            };
            console.log('tarea info',data);
            // return false;
            //Método que envia los datos al api rest
            this.$http.put(window._apiURL+'tareas/'+this.tarea_info.id, data)
            .then(function (respuesta) {
              console.log(respuesta);
              let that = this;
              that.message ='';

              if (respuesta.status == '400') {
                 toastr.error(respuesta.body.error,respuesta.body.msg,this.option_toast);
                 return false
               }else if (respuesta.status != '200') {
                 if (Object.keys(respuesta.body.obj).length>0) {
                   this.setErrors(respuesta.body.obj);
                 }
                 toastr.warning(this.message,respuesta.body.msg,this.option_toast);
               }else{
                if (respuesta.body.error == 0) {
                  toastr.success(respuesta.body.msg,'',this.option_toast);
                  this.descripcion="";
                  this.comentarios_array.unshift(respuesta.body.user_coment);
                  console.log(respuesta);
                  setTimeout(function () {location.reload(true);}, 500);
                  //setTimeout(function(){ that.errors.clear(); }, 50);
                }else{
                  $.each(respuesta.body.obj, function(index, value) {
                    let campo = index.replace(/_id/g, '');
                    campo = campo.replace(/_/g, ' ');
                    value = value[0].replace(/ id /g, '');
                    that.message += '<strong>'+campo + '</strong>: '+value+ '</br>';
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
          }, (err) => {
            if (err.status == 404) {
             toastr.error('No se encontraron resultados, verfique la informacion','Error',this.option_toast);
           } else {
             if (Object.keys(err.body.obj).length>0) {
               this.setErrors(err.body.obj);
             }else{
               that.message = err.body.error;
             }
             console.log(err)
             toastr.error(this.message,err.body.msg,this.option_toast);
           }
         }).then(() => {
           this.errors.clear();
           console.log(this.errors);
         });


        },
        guardarDatos:function () {
          if (this.tarea_info.fecha_entrega_area != null) {
            this.state.disabled_cuentas.to = moment(this.tarea_info.fecha_entrega_area).toDate();
          }
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
            if (respuesta.status != '200') {
              if (Object.keys(respuesta.body.obj).length>0) {
                 this.setErrors(respuesta.body.obj);
              }
              toastr.warning(this.message,respuesta.body.msg,this.option_toast);
            }else{
              this.descripcion=" ";
              this.descripcion_fake=" ";
              this.descripcion_requerida=true;
              this.comentarios_array.unshift(respuesta.body.user_coment);
              toastr.success(respuesta.body.msg,'',this.option_toast);
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
              console.log(err)
              toastr.error(this.message,err.body.msg,this.option_toast);
            }
         });
        },
        updateResource(data){
          this.comentarios_array = data
        }
      }

}

</script>
