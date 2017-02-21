<template>


	<div>
	<audio id="chatAudio"><source :src="_baseURL+'/media/alert.mp3'" type="audio/mp3"></audio>
		<ul class="menu" id="menur">
			<li v-for="notificacion in notificaciones" >
				<a  v-on:click="goTarea(notificacion.data)">
				<!-- <a  v-on:click="sumNotify(notificacion.data)"> -->
					<div class="pull-left" v-if="notificacion.data.img_perfil == null">
						<img :src="_baseURL+'/images/perfil.jpg'" class="img-circle" alt="User Image" >
					</div>
					<div class="pull-left" v-else>
						<img v-bind:src="notificacion.data.img_perfil" class="img-circle" alt="User Image" >
					</div>

					<h4>
						{{notificacion.data.nombre}}
						<small><i class="fa fa-clock-o"></i> {{notificacion.time_ago}}</small>
					</h4>
					<p>{{notificacion.data.descripcion}}</p>
				</a>
			</li>
		</ul>
	</div>
</template>
<script>
import Push from 'push.js'
import moment from 'moment'
// import notificaciones_total from './notificaciones_total.vue'
	module.exports= {
		props:['id'],
	    data () {
		      return {
		      	notificaciones:[],
		      	no_leidas:0,
		      	option_toast:{
		          timeOut: 5000,
		          "positionClass": "toast-bottom-right",
		          "closeButton": true,
		        },
		      }
		},
		created: function(){
	        this.getNotifications();
	        // this.getUnReadNotifications();
	        this.$parent.$on('asd', function(obj) {
				console.log('-----------------------',obj)
			});
	    },
	    mounted(){
	    	if (!('Notification' in window)) {
				// el navegador no soporta la API de notificaciones
				alert('Su navegador no soporta la API de Notificaciones :(');
				return;
			}
			Push.Permission.request();
			Push.Permission.get();
				/*Push.create("Notifiación Prueba", {
			    body: "Hola, ya has activado las notifiaciones",
			    icon: 'icon.png',
			    timeout: 4000,
			    link: 'home',
			    onClick: function () {
			        window.focus();
			        this.close();
			    }
			});*/
			this.listen();
			$('.menu').slimScroll({});
			

		},
		methods:{
			listen:function() {
				Echo.private('App.User.'+this.id)
				.notification( (notification) => {
					console.log(notification);
					this.notificaciones.push({data:notification,time_ago:moment().fromNow()});
					toastr.success(notification.descripcion,'',this.option_toast);
					Push.clear();
					Push.create(notification.nombre, {
					    body: notification.descripcion,
					    icon: window._baseURL+notification.img_perfil,
					    timeout: 10000,
					    onClick: function () {
					        window.focus();
					        this.close();
					    }
					});
					this.$parent.$emit('new_notify',1);
					$('#chatAudio')[0].play();
				}, (error)=>{
					console.log(error);
				});
			},
			getNotifications:function() {
				this.$http.get(window._baseURL+'/notificaciones').then(response => {
		            this.notificaciones = response.body;
		          })
			},
			/*getUnReadNotifications:function() {
				this.$http.get('/notificaciones_no_leidas/').then(response => {
					console.log(response.body)
		            this.no_leidas = response.body;
		            this.$parent.$emit('total_notificaciones',this.no_leidas);
		          })
			},*/
			goTarea:function(data) {
				window.location.href = window._baseURL+data.link;
			},
			sumNotify:function() {
				this.$parent.$emit('new_notify',1);
			},
		}
	}
	// Vue.component('notificaciones_total', notificaciones_total);
</script>
