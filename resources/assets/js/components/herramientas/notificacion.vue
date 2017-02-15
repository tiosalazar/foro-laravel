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
				Echo.private('App.User.'+ this.id)
				.notification( (notification) => {
					alert('New notification');
					console.log(notification);
				});
			},
		}
	}
</script>