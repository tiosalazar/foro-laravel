<template>
	<div>

		<table class="table table-striped table-hover  table-bordered dataTable no-footer" id="tabla_usuarios">
		  <thead>
		        <tr>
		          <th >Nombre</th>
		          <th >Apellidos</th>
		          <th >Email</th>
		          <th >Cargo</th>
		          <th >Teléfono</th>
		          <th >Horas Disponibles</th>
		          <th >Rol</th>
		          <th >Area</th>
		          <th >Estado</th>
		          <th >Edicion</th>
		        </tr>
		    </thead>

        </table>



	</div>
</template>


<script>

	import table from 'datatables.net';
	 Vue.component('crear_user',require('./crear_usuario.vue'));
	 Vue.component('select_area',require('../herramientas/select_area.vue'));



	module.exports={

		data(){
			return{
				list_usuarios:[],
				boton_hidden:false,

			}
		},
		 created: function(){

	      this.list_usuarios_api();

	     },
	     mounted () {


    	},
		methods:{

			list_usuarios_api: function(){

                 setTimeout(function(){

                 	$('#tabla_usuarios').DataTable({
                 	   processing: true,
				       serverSide: false,
							 'ajax': {
	 						    'url': window._apiURL+"usuarios",
	 						    'type': 'GET',
	 						    'beforeSend': function (request) {
	 						        request.setRequestHeader("Authorization", 'Bearer '+Laravel.api_token);
	 						    }
	 						},
						   columns: [

						       { data: 'nombre', name: 'nombre' },
						       { data: 'apellido', name: 'apellido' },
						       { data: 'email', name: 'email' },
						       { data: 'cargo', name: 'cargo' },
						       { data: 'telefono', name: 'telefono' },
						       { data: 'horas_disponible', name: 'horas_disponible' },
						       { data: 'roles_id', name: 'roles_id' },
						       { data: 'areas_id', name: 'areas_id' },
						       { data: 'estado', name: 'estado' },
						       ],
						  columnDefs: [
						   {
						       "targets": [8],
						       "data": null,
						       "render": function(data, type, full) { // Devuelve el contenido personalizado
						            return (full.estado==1)? 'Activo' : 'Inactivo';

						                 }
						   },
						   {
						       "targets": [9],
						       "data": null,
						       "render": function(data, type, full) { // Devuelve el contenido personalizado

						          return '<a href="editar_usuario/'+full.id+'" class="btn btn-warning btn-xs usuario_edit"   aria-label="View">Editar</a>';
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


		}
	}



</script>
