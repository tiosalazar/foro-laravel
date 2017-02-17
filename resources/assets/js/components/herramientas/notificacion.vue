<template>
	<div>
		hola mundo
	</div>
</template>
<script>
	module.exports= {
		props:['id'], 
	    data () {
		      return {}
		},
		mounted(){
			this.listen();
		},
		methods:{
			listen:function() {
				Echo.private('App.User.1')
				.notification( (notification) => {
					alert('New notification');
					console.log(notification);
				}, (error)=>{
					console.log(error);
				});
				/*Echo.channel('orders')
			    .listen('OrderShipped', (e) => {
			        console.log(e.order.name);
			    });*/
			},
		}
	}
</script>