<template>
	<div>
		<ul class="menu">
			<li v-for="notificacion in notificaciones" >
				<a  v-on:click="goTarea(notificacion.data.id_tarea)">
					<div class="pull-left" v-if="notificacion.data.img_perfil == null">
						<img :src="_baseURL+'/images/perfil.jpg'" class="img-circle" alt="User Image" >
					</div>
					<div class="pull-left" v-else>
						<img v-bind:src="notificacion.data.img_perfil" class="img-circle" alt="User Image" >
					</div>

					<h4>
						{{notificacion.data.nombre}}
						<small><i class="fa fa-clock-o"></i> {{notificacion.data.created_at}}</small>
					</h4>
					<p>{{notificacion.data.descripcion}}</p>
				</a>
			</li>
		</ul>
	</div>
</template>
<script>
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
	        this.$on('asd', function(obj) {
				console.log('-----------------------',obj)
			});
	    },
		mounted(){
			this.listen();
			$('.menu').slimScroll({});
		},
		methods:{
			listen:function() {
				Echo.private('App.User.'+this.id)
				.notification( (notification) => {
					// alert('New notification');
					console.log(notification);
					// let hoy = new Date();
					// notification.created_at = Math.abs(notification.created_at - hoy);
					this.notificaciones.push(notification);
					toastr.success(notification.descripcion,'',this.option_toast);
				}, (error)=>{
					console.log(error);
				});
				/*Echo.channel('orders')
			    .listen('OrderShipped', (e) => {
			        console.log(e.order.name);
			    });*/
			},
			getNotifications:function() {
				this.$http.get('/notificaciones/').then(response => {
					console.log(response.body)
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
			goTarea:function(id) {
				window.location.href = '/ver_tarea/'+id;
			}
		}
	}
</script>
