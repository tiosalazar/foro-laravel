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
				<span   v-bind:class="'label label-estado estado-'+[info_requerimiento.estado_prioridad.tipos_estados_id]+'-'+[info_requerimiento.estado_prioridad.id]">{{info_requerimiento.estado_prioridad.nombre}}</span>
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
		<!-- <div v-if=" (rol_actual =='owner') || (rol_actual =='desarrollo') || (rol_actual =='cuentas') " > -->
                  <button type="button" class="btn btn-primary" v-on:click="asignar_estado()">Publicar</button>
                  <button type="button" class="btn btn-primary" v-on:click="enviarcomentarios()">Comentar</button>
           <!-- </div> -->
           <!-- <div v-else> -->
                  <!-- <button type="button" class="btn btn-primary" v-on:click="enviarcomentarios()">Comentar</button> -->
           <!-- </div> -->
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
			// this.comentarios_array = [{"id":6085,"comentarios":"Tarea programada.","usuarios_comentario_id":9,"tareas_id":2000,"estados_id":3,"created_at":"2017-07-31 08:12:04","updated_at":"2017-07-31 08:12:04","requerimientos_clientes_id":null,"user":{"id":9,"nombre":"Andres Fabian","apellido":"Mabesoy Jimenez","cargo":"Encargado de Dise\u00f1o","telefono":"3799180","email":"afmabesoy@himalayada.com","estado":1,"horas_disponible":"160.00","horas_gastadas":"28.00","api_token":"W5mQJidqz3LufqDiuW0kTRlMGeBpOqLBC6n4YCpFP6GSGdiDEYJqC1AWxI4h","fecha_nacimiento":"1996-04-18","img_perfil":"\/images\/avatars\/AndresFabian_9.png","roles_id":4,"areas_id":2,"created_at":"2017-03-31 19:21:13","updated_at":"2017-08-29 14:19:33","access_token":"{\"access_token\":\"ya29.Glu2BLGvW-NOVU4dYIhUm8nOheG4LEYA2PqE9Cupd4T8FNUkAU0nQgOOiFk58EGAzkm9qZ_uuxneEJoH2IhJtnw9RB_sfoeugYlP5M4YWeqtnu-M6ZGlpVn_Isr2\",\"token_type\":\"Bearer\",\"expires_in\":3600,\"created\":1504034373,\"refresh_token\":\"1\\\/NzxywklD3SKcW808RnLwEL2LnRryxiJGWoiZEDtyWq4\"}","clientes_id":null},"estados":{"id":3,"nombre":"Programado","tipos_estados_id":1,"created_at":"2017-03-31 17:32:19","updated_at":"2017-03-31 17:32:19"}},{"id":6202,"comentarios":"&nbsp;Ajustes Catalogo<ol style=\"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 12.8px;\"><li style=\"margin-left: 15px;\">De la imagen 2 falta cambiar el icono del candado por otro que exprese la c\u00e9dula.<\/li><li style=\"margin-left: 15px;\">En la imagen 3 el formulario estar\u00e1 construido por la c\u00e9dula a cambio de la contrase\u00f1a, es decir, los campos campos contrase\u00f1a y confirmar contrase\u00f1a deben decir \"c\u00e9dula\" y \"confirmar c\u00e9dula\".<\/li><li style=\"margin-left: 15px;\">La imagen 4 se debe ajustar los iconos del formulario ya que tiene una linea gr\u00e1fica diferente a la que se ha propuesto en el dise\u00f1o (Degradado, complejos, los actuales son mas minimalistas). La calificaci\u00f3n no describe interacci\u00f3n, no parece que e pudiese calificar, es mas bien est\u00e1tica. La tabla de especificaciones debe ir abajo, como esta actualmente. El precio de la moto no debe llevar mas texto que el valor neto menos la cuota inicial, este ser\u00e1 el valor a financiar.<\/li><\/ol>","usuarios_comentario_id":29,"tareas_id":2000,"estados_id":null,"created_at":"2017-07-31 17:21:02","updated_at":"2017-07-31 17:21:02","requerimientos_clientes_id":null,"user":{"id":29,"nombre":"Diana ","apellido":"Chavez","cargo":"Ejecutiva de cuenta","telefono":"","email":"dmchavez@himalayada.com","estado":1,"horas_disponible":"80.00","horas_gastadas":"0.00","api_token":"1PGxnjCgHHjjLmqi3Ac6eniWf6Kebzsx8gr0JWEqDj1l0KiV0icpbudUQNbu","fecha_nacimiento":"1986-02-14","img_perfil":null,"roles_id":3,"areas_id":6,"created_at":"2017-05-15 14:08:38","updated_at":"2017-08-23 11:24:23","access_token":null,"clientes_id":null},"estados":null},{"id":6310,"comentarios":"Realizar ajustes de catalogo enviados por el cliente se comparten en doc de drive","usuarios_comentario_id":29,"tareas_id":2000,"estados_id":null,"created_at":"2017-08-01 23:27:13","updated_at":"2017-08-01 23:27:13","requerimientos_clientes_id":null,"user":{"id":29,"nombre":"Diana ","apellido":"Chavez","cargo":"Ejecutiva de cuenta","telefono":"","email":"dmchavez@himalayada.com","estado":1,"horas_disponible":"80.00","horas_gastadas":"0.00","api_token":"1PGxnjCgHHjjLmqi3Ac6eniWf6Kebzsx8gr0JWEqDj1l0KiV0icpbudUQNbu","fecha_nacimiento":"1986-02-14","img_perfil":null,"roles_id":3,"areas_id":6,"created_at":"2017-05-15 14:08:38","updated_at":"2017-08-23 11:24:23","access_token":null,"clientes_id":null},"estados":null},{"id":6397,"comentarios":"Env\u00edo ajustes por email a Diana Chavez","usuarios_comentario_id":26,"tareas_id":2000,"estados_id":2,"created_at":"2017-08-02 17:32:26","updated_at":"2017-08-02 17:32:26","requerimientos_clientes_id":null,"user":{"id":26,"nombre":"Juan Pablo ","apellido":"Murillo Parra","cargo":"Digital Design Leader","telefono":"3865350","email":"jpmurillo@himalayada.com","estado":1,"horas_disponible":"160.00","horas_gastadas":"53.50","api_token":"ZxeaoRUUzJSxcKM7fxVkjAOTvZ2eG5GKid2yMtL6KsBMSNJpa0VaMNDdEZXp","fecha_nacimiento":"1979-02-11","img_perfil":"\/images\/avatars\/JuanPablo_26.png","roles_id":5,"areas_id":2,"created_at":"2017-04-03 17:34:53","updated_at":"2017-08-23 11:44:13","access_token":null,"clientes_id":null},"estados":{"id":2,"nombre":"Realizado","tipos_estados_id":1,"created_at":"2017-03-31 17:32:19","updated_at":"2017-03-31 17:32:19"}},{"id":6398,"comentarios":"","usuarios_comentario_id":9,"tareas_id":2000,"estados_id":3,"created_at":"2017-08-02 17:33:01","updated_at":"2017-08-02 17:33:01","requerimientos_clientes_id":null,"user":{"id":9,"nombre":"Andres Fabian","apellido":"Mabesoy Jimenez","cargo":"Encargado de Dise\u00f1o","telefono":"3799180","email":"afmabesoy@himalayada.com","estado":1,"horas_disponible":"160.00","horas_gastadas":"28.00","api_token":"W5mQJidqz3LufqDiuW0kTRlMGeBpOqLBC6n4YCpFP6GSGdiDEYJqC1AWxI4h","fecha_nacimiento":"1996-04-18","img_perfil":"\/images\/avatars\/AndresFabian_9.png","roles_id":4,"areas_id":2,"created_at":"2017-03-31 19:21:13","updated_at":"2017-08-29 14:19:33","access_token":"{\"access_token\":\"ya29.Glu2BLGvW-NOVU4dYIhUm8nOheG4LEYA2PqE9Cupd4T8FNUkAU0nQgOOiFk58EGAzkm9qZ_uuxneEJoH2IhJtnw9RB_sfoeugYlP5M4YWeqtnu-M6ZGlpVn_Isr2\",\"token_type\":\"Bearer\",\"expires_in\":3600,\"created\":1504034373,\"refresh_token\":\"1\\\/NzxywklD3SKcW808RnLwEL2LnRryxiJGWoiZEDtyWq4\"}","clientes_id":null},"estados":{"id":3,"nombre":"Programado","tipos_estados_id":1,"created_at":"2017-03-31 17:32:19","updated_at":"2017-03-31 17:32:19"}},{"id":6401,"comentarios":"2 horas m\u00e1s por los ajustes realizados el 2 de agosto<div><br><\/div><div>Los \u00faltimos ajustes los envi\u00e9 a Diana Chaves al correo<\/div>","usuarios_comentario_id":26,"tareas_id":2000,"estados_id":2,"created_at":"2017-08-02 17:36:09","updated_at":"2017-08-02 17:36:09","requerimientos_clientes_id":null,"user":{"id":26,"nombre":"Juan Pablo ","apellido":"Murillo Parra","cargo":"Digital Design Leader","telefono":"3865350","email":"jpmurillo@himalayada.com","estado":1,"horas_disponible":"160.00","horas_gastadas":"53.50","api_token":"ZxeaoRUUzJSxcKM7fxVkjAOTvZ2eG5GKid2yMtL6KsBMSNJpa0VaMNDdEZXp","fecha_nacimiento":"1979-02-11","img_perfil":"\/images\/avatars\/JuanPablo_26.png","roles_id":5,"areas_id":2,"created_at":"2017-04-03 17:34:53","updated_at":"2017-08-23 11:44:13","access_token":null,"clientes_id":null},"estados":{"id":2,"nombre":"Realizado","tipos_estados_id":1,"created_at":"2017-03-31 17:32:19","updated_at":"2017-03-31 17:32:19"}},{"id":6402,"comentarios":"En el correo de la ejecutiva.","usuarios_comentario_id":9,"tareas_id":2000,"estados_id":20,"created_at":"2017-08-02 17:44:43","updated_at":"2017-08-02 17:44:43","requerimientos_clientes_id":null,"user":{"id":9,"nombre":"Andres Fabian","apellido":"Mabesoy Jimenez","cargo":"Encargado de Dise\u00f1o","telefono":"3799180","email":"afmabesoy@himalayada.com","estado":1,"horas_disponible":"160.00","horas_gastadas":"28.00","api_token":"W5mQJidqz3LufqDiuW0kTRlMGeBpOqLBC6n4YCpFP6GSGdiDEYJqC1AWxI4h","fecha_nacimiento":"1996-04-18","img_perfil":"\/images\/avatars\/AndresFabian_9.png","roles_id":4,"areas_id":2,"created_at":"2017-03-31 19:21:13","updated_at":"2017-08-29 14:19:33","access_token":"{\"access_token\":\"ya29.Glu2BLGvW-NOVU4dYIhUm8nOheG4LEYA2PqE9Cupd4T8FNUkAU0nQgOOiFk58EGAzkm9qZ_uuxneEJoH2IhJtnw9RB_sfoeugYlP5M4YWeqtnu-M6ZGlpVn_Isr2\",\"token_type\":\"Bearer\",\"expires_in\":3600,\"created\":1504034373,\"refresh_token\":\"1\\\/NzxywklD3SKcW808RnLwEL2LnRryxiJGWoiZEDtyWq4\"}","clientes_id":null},"estados":{"id":20,"nombre":"Entregado","tipos_estados_id":1,"created_at":"2017-03-31 17:32:19","updated_at":"2017-03-31 17:32:19"}},{"id":6403,"comentarios":"En el correo de la ejecutiva.","usuarios_comentario_id":9,"tareas_id":2000,"estados_id":20,"created_at":"2017-08-02 17:44:43","updated_at":"2017-08-02 17:44:43","requerimientos_clientes_id":null,"user":{"id":9,"nombre":"Andres Fabian","apellido":"Mabesoy Jimenez","cargo":"Encargado de Dise\u00f1o","telefono":"3799180","email":"afmabesoy@himalayada.com","estado":1,"horas_disponible":"160.00","horas_gastadas":"28.00","api_token":"W5mQJidqz3LufqDiuW0kTRlMGeBpOqLBC6n4YCpFP6GSGdiDEYJqC1AWxI4h","fecha_nacimiento":"1996-04-18","img_perfil":"\/images\/avatars\/AndresFabian_9.png","roles_id":4,"areas_id":2,"created_at":"2017-03-31 19:21:13","updated_at":"2017-08-29 14:19:33","access_token":"{\"access_token\":\"ya29.Glu2BLGvW-NOVU4dYIhUm8nOheG4LEYA2PqE9Cupd4T8FNUkAU0nQgOOiFk58EGAzkm9qZ_uuxneEJoH2IhJtnw9RB_sfoeugYlP5M4YWeqtnu-M6ZGlpVn_Isr2\",\"token_type\":\"Bearer\",\"expires_in\":3600,\"created\":1504034373,\"refresh_token\":\"1\\\/NzxywklD3SKcW808RnLwEL2LnRryxiJGWoiZEDtyWq4\"}","clientes_id":null},"estados":{"id":20,"nombre":"Entregado","tipos_estados_id":1,"created_at":"2017-03-31 17:32:19","updated_at":"2017-03-31 17:32:19"}},{"id":7118,"comentarios":"","usuarios_comentario_id":9,"tareas_id":2000,"estados_id":2,"created_at":"2017-08-23 10:11:02","updated_at":"2017-08-23 10:11:02","requerimientos_clientes_id":null,"user":{"id":9,"nombre":"Andres Fabian","apellido":"Mabesoy Jimenez","cargo":"Encargado de Dise\u00f1o","telefono":"3799180","email":"afmabesoy@himalayada.com","estado":1,"horas_disponible":"160.00","horas_gastadas":"28.00","api_token":"W5mQJidqz3LufqDiuW0kTRlMGeBpOqLBC6n4YCpFP6GSGdiDEYJqC1AWxI4h","fecha_nacimiento":"1996-04-18","img_perfil":"\/images\/avatars\/AndresFabian_9.png","roles_id":4,"areas_id":2,"created_at":"2017-03-31 19:21:13","updated_at":"2017-08-29 14:19:33","access_token":"{\"access_token\":\"ya29.Glu2BLGvW-NOVU4dYIhUm8nOheG4LEYA2PqE9Cupd4T8FNUkAU0nQgOOiFk58EGAzkm9qZ_uuxneEJoH2IhJtnw9RB_sfoeugYlP5M4YWeqtnu-M6ZGlpVn_Isr2\",\"token_type\":\"Bearer\",\"expires_in\":3600,\"created\":1504034373,\"refresh_token\":\"1\\\/NzxywklD3SKcW808RnLwEL2LnRryxiJGWoiZEDtyWq4\"}","clientes_id":null},"estados":{"id":2,"nombre":"Realizado","tipos_estados_id":1,"created_at":"2017-03-31 17:32:19","updated_at":"2017-03-31 17:32:19"}},{"id":7120,"comentarios":"","usuarios_comentario_id":9,"tareas_id":2000,"estados_id":1,"created_at":"2017-08-23 10:11:23","updated_at":"2017-08-23 10:11:23","requerimientos_clientes_id":null,"user":{"id":9,"nombre":"Andres Fabian","apellido":"Mabesoy Jimenez","cargo":"Encargado de Dise\u00f1o","telefono":"3799180","email":"afmabesoy@himalayada.com","estado":1,"horas_disponible":"160.00","horas_gastadas":"28.00","api_token":"W5mQJidqz3LufqDiuW0kTRlMGeBpOqLBC6n4YCpFP6GSGdiDEYJqC1AWxI4h","fecha_nacimiento":"1996-04-18","img_perfil":"\/images\/avatars\/AndresFabian_9.png","roles_id":4,"areas_id":2,"created_at":"2017-03-31 19:21:13","updated_at":"2017-08-29 14:19:33","access_token":"{\"access_token\":\"ya29.Glu2BLGvW-NOVU4dYIhUm8nOheG4LEYA2PqE9Cupd4T8FNUkAU0nQgOOiFk58EGAzkm9qZ_uuxneEJoH2IhJtnw9RB_sfoeugYlP5M4YWeqtnu-M6ZGlpVn_Isr2\",\"token_type\":\"Bearer\",\"expires_in\":3600,\"created\":1504034373,\"refresh_token\":\"1\\\/NzxywklD3SKcW808RnLwEL2LnRryxiJGWoiZEDtyWq4\"}","clientes_id":null},"estados":{"id":1,"nombre":"OK","tipos_estados_id":1,"created_at":"2017-03-31 17:32:19","updated_at":"2017-03-31 17:32:19"}},{"id":7121,"comentarios":"","usuarios_comentario_id":9,"tareas_id":2000,"estados_id":1,"created_at":"2017-08-23 10:11:23","updated_at":"2017-08-23 10:11:23","requerimientos_clientes_id":null,"user":{"id":9,"nombre":"Andres Fabian","apellido":"Mabesoy Jimenez","cargo":"Encargado de Dise\u00f1o","telefono":"3799180","email":"afmabesoy@himalayada.com","estado":1,"horas_disponible":"160.00","horas_gastadas":"28.00","api_token":"W5mQJidqz3LufqDiuW0kTRlMGeBpOqLBC6n4YCpFP6GSGdiDEYJqC1AWxI4h","fecha_nacimiento":"1996-04-18","img_perfil":"\/images\/avatars\/AndresFabian_9.png","roles_id":4,"areas_id":2,"created_at":"2017-03-31 19:21:13","updated_at":"2017-08-29 14:19:33","access_token":"{\"access_token\":\"ya29.Glu2BLGvW-NOVU4dYIhUm8nOheG4LEYA2PqE9Cupd4T8FNUkAU0nQgOOiFk58EGAzkm9qZ_uuxneEJoH2IhJtnw9RB_sfoeugYlP5M4YWeqtnu-M6ZGlpVn_Isr2\",\"token_type\":\"Bearer\",\"expires_in\":3600,\"created\":1504034373,\"refresh_token\":\"1\\\/NzxywklD3SKcW808RnLwEL2LnRryxiJGWoiZEDtyWq4\"}","clientes_id":null},"estados":{"id":1,"nombre":"OK","tipos_estados_id":1,"created_at":"2017-03-31 17:32:19","updated_at":"2017-03-31 17:32:19"}}]

	},
	methods:{
		setComments:function () {
          this.$http.get(window._apiURL+'comentarios/'+this.info_requerimiento.id)
          .then(function(respuesta){
            this.comentarios_array=respuesta.body;
            console.log('comentarios',this.comentarios_array);
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