<template>
	<div>
        <table class="table table-striped table-hover  table-bordered dataTable no-footer" id="tabla_tareas">
		  <thead>
		        <tr>    
		          <th >OT</th>
		          <th >Cliente</th>
		          <th >Requerimiento</th>
		          <th >Fecha de Solicitud</th> 
		          <th >Estado</th> 
		          <th >Editar</th>
		          <!-- <th >Fee</th> -->
		          <!-- <th >Rol</th> 
		            <th >Area</th>
		            <th >Estado</th>
		            <th >Edicion</th> -->  
		        </tr>
		    </thead>
        </table>
	</div>
</template>
<script>
	import table from 'datatables.net';
	module.exports={
		data(){
			return{
				list_tareas:[],
				tareas:[],
				boton_hidden:false,
			}
		},
		created: function(){
			this.list_tareas_api();
			this.getTareass();
		},
		watch:{},
		methods:{
			getTareass:function() {
				this.$http.get('api/v1/tareas').then(function(respuesta){
					console.log(respuesta);
					this.tareas = respuesta.body;
				},function(error) {
					console.log(error);
				})
			},
			list_tareas_api: function(){
				setTimeout(function(){
					$('#tabla_tareas').DataTable({
						processing: true,
						serverSide: true,
						ajax: "/api/v1/tareas",
						columns: [
						{ data: 'ot.referencia', name: 'ot.referencia' },
						{ data: 'ot.cliente.nombre', name: 'ot.cliente.nombre' },
						{ data: 'nombre_tarea', name: 'nombre_tarea' },
						{ data: 'created_at', name: 'created_at' },
						// { data: 'estado.nombre', name: 'estado.nombre' },
						// { data: 'telefono', name: 'telefono' },
						/*{ data: 'horas_disponible', name: 'horas_disponible' },
						{ data: 'roles_id', name: 'roles_id' },
						{ data: 'areas_id', name: 'areas_id' },
						{ data: 'estado', name: 'estado' },*/
						], 
						columnDefs: [
						{
							"targets": [4],
							"data": null,
						       "render": function(data, type, full) { // Devuelve el contenido personalizado
						       	return '<span class="label label-estado estado-'+data.estado.tipos_estados_id+'-'+data.estado.id+' ">'+data.estado.nombre+'</span>';
						       	// return (full.estado==1)? 'Activo' : 'Inactivo';

						       }
						   },
						   {
						   	"targets": [5],
						   	"data": null,
						       "render": function(data, type, full) { // Devuelve el contenido personalizado
						       	return '<a href="all_tareas/'+full.id+'" class="btn btn-primary btn-xs btn-flat btn-block usuario_edit"   aria-label="View">Ver tarea</a>';        
						       }
						   }
						   ],
						   autoWidth: true,
						   responsive: true,
						   language: {
						   	"url": "//cdn.datatables.net/plug-ins/1.10.12/i18n/Spanish.json"
						   },      

						});
				}, 0);


			}
		},

	}
</script>