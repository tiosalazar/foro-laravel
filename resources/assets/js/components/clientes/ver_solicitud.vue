<template>
<div>
	<form role="form" name="crear_solicitudes" class="crear_solicitudes">
	<div class="box-body">
		<div class="row">
			<div class="col-sm-12">
				<div class="form-group date required">
				<label for="nombre_solicitud">Nombre de la Solicitud:   </label>
				{{info_requerimiento.nombre}}
				</div>
			</div>

			<div class="col-sm-7">
				<label>Fecha entrega deseada</label> <br>
				{{info_requerimiento.fecha_ideal_entrega}}
			</div>


			<div class="col-sm-5">
				<div class="form-group required">
				<label>Estado:</label>
				 <div v-if="info_requerimiento.estado_prioridad!=null">
                 <span   v-bind:class="'label label-estado estado-'+[info_requerimiento.estado_prioridad.tipos_estados_id]+'-'+[info_requerimiento.estado_prioridad.id]">{{info_requerimiento.estado_prioridad.nombre}}</span>
                </div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-12">
				<div class="form-group required">
					<label> Descripción</label>
					<textarea readonly  >{{info_requerimiento.descripcion}}
					</textarea>
				</div>
			</div>
		</div>
	</div>

	<div class="box-footer text-center">
	<div class="row">
			<div class="col-sm-12">
				<div class="form-group required">
					<label> Comentario</label>
					<textarea v-model="comentario_texto"></textarea>
				</div>
			</div>
		</div>
		<select_estados tipo_estado="6"  :select="info_requerimiento.estado_prioridad"></select_estados>
		<div v-if=" (rol_actual =='owner') || (rol_actual =='desarrollo') || (rol_actual =='cuentas') " >
                  <button type="button" class="btn btn-primary" v-on:click="asignar_estado()">Publicar</button>
                  <button type="button" class="btn btn-primary" v-on:click="enviarcomentarios()">Comentar</button>
           </div> 
           <div v-else> 
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
</template>


<script>
import VueHtml5Editor from 'vue-html5-editor';
Vue.use(VueHtml5Editor);

module.exports = {
	props: ['requerimientoarray','rol_usuario_actual','id_usuario_actual'],
    data(){
	
	return{
		comentarios_array:[],
		info_requerimiento:[],
		descripcion: '',
		paginate: ['comentarios_array'],
		rol_actual:'',
		prioridad:'',
		comentario_texto:'',
	}
},
	created: function(){

			if (typeof(this.requerimientoarray)!= 'undefined') {
				this.info_requerimiento= JSON.parse(this.requerimientoarray);
				console.log(this.info_requerimiento);
			}
			this.rol_actual=this.rol_usuario_actual;
			this.setComments();
			this.$on('select_estado', function(v) {
				this.info_requerimiento.estado_prioridad = v;
			});
			
	},
	methods:{
		setComments:function () {
          this.$http.get(window._apiURL+'comentarios/'+this.info_requerimiento.id)
          .then(function(respuesta){
            this.comentarios_array=respuesta.body;
            console.log('comentarios',this.comentarios_array);
            console.log('estado',this.comentarios_array.estados);
            this.comentarios_array.reverse();
          });
          },
          asignar_estado:function () {
          	this.$http.put(window._apiURL+'clientes_requerimiento/'+this.info_requerimiento.id, {estados_id:this.info_requerimiento.estado_prioridad.id})
	          .then(function(respuesta){
	          });

          	let data = {
            comentarios:this.comentario_texto,
            usuarios_comentario_id:this.id_usuario_actual,
            is_comment:1,
            requerimientos_clientes_id:this.info_requerimiento.id
          }

          this.$http.post(window._apiURL+'comentarios/', data)
          .then(function(respuesta){
            if (respuesta.status != '200') {
              if (Object.keys(respuesta.body.obj).length>0) {
                 this.setErrors(respuesta.body.obj);
              }
              toastr.warning(this.message,respuesta.body.msg,this.option_toast);
            }else{
              this.comentario_texto=" ";
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
		enviarcomentarios:function(){
          if (this.comentario_texto=="") {
            this.descripcion_requerida=false;
            return false;
          }
          let data = {
            comentarios:this.comentario_texto,
            usuarios_comentario_id:this.id_usuario_actual,
            is_comment:1,
            requerimientos_clientes_id:this.info_requerimiento.id
          }

          this.$http.post(window._apiURL+'comentarios/', data)
          .then(function(respuesta){
            if (respuesta.status != '200') {
              if (Object.keys(respuesta.body.obj).length>0) {
                 this.setErrors(respuesta.body.obj);
              }
              toastr.warning(this.message,respuesta.body.msg,this.option_toast);
            }else{
              this.comentario_texto=" ";
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
	}
}


Vue.component('select_prioridad',require('../herramientas/select_prioridad.vue'));

</script>