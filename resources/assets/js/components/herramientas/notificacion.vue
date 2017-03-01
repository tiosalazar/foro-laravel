<template>
	<div>
		<audio id="chatAudio"><source :src="_baseURL+'/media/alert.mp3'" type="audio/mp3"></audio>
		<ul class="menu" id="menur" ref="menur">
			<li v-for="notificacion in notificaciones" >
				<a  v-on:click="goTarea(notificacion.data)">
					<div class="pull-left" v-if="notificacion.data.img_perfil == null">
						<img :src="_baseURL+'/images/perfil.jpg'" class="img-circle" alt="User Image" >
					</div>
					<div class="pull-left" v-else>
						<img v-bind:src="_baseURL+notificacion.data.img_perfil" class="img-circle" alt="User Image" >
					</div>

					<h4>
						{{notificacion.data.nombre}}
						<small><i class="fa fa-clock-o"></i> {{notificacion.time_ago}}</small>
					</h4>
					<p>{{notificacion.data.descripcion}}</p>
				</a>
			</li>
			<mugen-scroll :handler="onInfinite" :should-handle="!loading" scroll-container="menur" v-show="!hidden">
			    <center><i class="fa fa-circle-o-notch fa-spin  fa-fw"></i>
				<span class="sr-only">Loading...</span></center>
    		</mugen-scroll>
		</ul>
	</div>
</template>
<script>
	import Push from 'push.js'
	import moment from 'moment'
	import MugenScroll from 'vue-mugen-scroll'
	module.exports= {
		components: {MugenScroll, }, 
		props:['id'],
		data () {
			return {
				notificaciones:[],
				no_leidas:0,
				loading: false,
				hidden:true,
				last:false,
				option_toast:{
					timeOut: 5000,
					"positionClass": "toast-bottom-right",
					"closeButton": true,
				},
			}
		},
		created: function(){
		},
		mounted(){
			if (!('Notification' in window)) {
				// el navegador no soporta la API de notificaciones
				toastr.error('Su navegador no soporta la API de Notificaciones :(','',this.option_toast);
				return;
			}
			Push.Permission.request();
			Push.Permission.get();
			this.listen();
			$('.menu').slimScroll({});
			

		},
		methods:{
			listen:function() {
				Echo.private('App.User.'+this.id)
				.notification( (notification) => {
					console.log(notification);
					this.notificaciones.unshift({data:notification,registered:moment().fromNow()});
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
					toastr.error('Comunicate con soporte por favor','Hubo un error en la notificación',this.option_toast);
				});
			},
			goTarea:function(data) {
				window.location.href = window._baseURL+data.link;
			},
			sumNotify:function() {
				this.$parent.$emit('new_notify',1);
			},
			onInfinite() {
				if (this.last) {
					return false;
				}
				this.loading = true
				this.hidden = false
				this.$http.get(window._baseURL+'/pageNotifications'
					, {
						params: {
							page: parseInt(this.notificaciones.length /4) +1,
						},
					}).then((res) => {
						console.log(res)
						if (res.body.data.length >=1) {
							this.notificaciones = this.notificaciones.concat(res.body.data);
							if (res.body.to == null || res.body.to == res.body.total) {
								this.loading = false
								this.hidden = true
								this.last=true;
							}
							this.loading = false
						} else {
							this.loading = false;
							this.hidden = true;
							this.last=true;
						}
					});
				},
			}
		}
</script>
