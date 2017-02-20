<template>
	<span class="label label-danger" v-on:click="readNotifications">{{no_leidas}}</span>
</template>
<script>
	module.exports= {
		data () {
		      return {
		      	no_leidas:0,
		      }
		},
		created: function(){
	        this.getUnReadNotifications();
	        this.$on('total_notificaciones', function(obj) {
				this.no_leidas= obj;
				console.log('total',obj)
			});
	    },
	    methods:{
	    	readNotifications:function() {
	    		// console.log('fucker')
	    		// this.$parent.$emit('asd','asd');
	    		this.$http.get('/leer_notificaciones/').then(response => {
					console.log(response.body)
		            // this.no_leidas = response.body;
		        })
	    	},
	    	getUnReadNotifications:function() {
				this.$http.get('/notificaciones_no_leidas/').then(response => {
					console.log(response.body)
		            this.no_leidas = response.body;
		            // this.$parent.$emit('total_notificaciones',this.no_leidas);
		          })
			},
	    }
	}
</script>