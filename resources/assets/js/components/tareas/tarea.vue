<template>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Crear Tarea</h3>
            </div>
            <!-- /.box-header -->
            <crear_tarea></crear_tarea>
          </div>
		</div>
	</div>
</template>
<script>
	export default {
      data(){
        return{
          usuarios:[],
        }
       },

   }
   Vue.component('crear_tarea',require('./crear_tarea.vue'));
</script>