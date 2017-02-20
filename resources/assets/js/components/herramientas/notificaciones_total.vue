<template>
	<a href="#" class="dropdown-toggle" data-toggle="dropdown" v-on:click="readNotifications">
		<i class="fa fa-bell-o"></i>
		<span class="label label-danger" v-if="no_leidas!=0">{{no_leidas}}</span>
	</a>
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
			let that = this;
			this.$parent.$on('new_notify', function(obj) {
				that.no_leidas += obj;
			});
	    },
	    methods:{
	    	readNotifications:function() {
	    		// console.log('fucker')
	    		// this.$parent.$emit('asd','asd');
	    		this.$http.get(window._baseURL+'/leer_notificaciones/').then(response => {
					console.log(response.body)
		            this.no_leidas=0;
		        })
	    	},
	    	getUnReadNotifications:function() {
				this.$http.get(window._baseURL+'/notificaciones_no_leidas').then(response => {
					console.log(response.body)
		            this.no_leidas = response.body;
		            // this.$parent.$emit('total_notificaciones',this.no_leidas);
		          })
			},
			asd:function() {
				this.$parent.$emit('asd','asd');
			}
	    }
	}
</script>