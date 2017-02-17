<template>
	<div>
		<ul class="menu">
			<li v-for="notificacion in notificaciones" >
				<a  v-on:click="goTarea(notificacion.id_tarea)">
					<div class="pull-left" v-if="notificacion.img_perfil == null">
						<img src="/images/perfil.jpg" class="img-circle" alt="User Image" >
					</div>
					<div class="pull-left" v-else>
						<img v-bind:src="notificacion.img_perfil" class="img-circle" alt="User Image" >
					</div>
					<h4>
						{{notificacion.nombre}}
						<small><i class="fa fa-clock-o"></i> {{notificacion.created_at}}</small>
					</h4>
					<p>{{notificacion.descripcion}}</p>
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
		      	notificaciones:[
		      		{
		      			'id_tarea':'5',
		      			'nombre':'OT creada',
		      			'created_at': '5 mins',
		      			'descripcion':'Why not buy a new awesome theme?',
		      			'img_perfil':null,
		      		}
		      	],
		      	option_toast:{
		          timeOut: 5000,
		          "positionClass": "toast-bottom-right",
		          "closeButton": true,
		        },
		      }
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
			goTarea:function(id) {
				window.location.href = '/ver_tarea/'+id;
			}
		}
	}
</script>