<template>
	<div>
		<table class="table table-striped table-hover  table-bordered dataTable no-footer" id="tabla_usuarios">
		  <thead>
		        <tr>
		          <th >Nombres</th>
		          <th >Apellidos</th>
		          <th >Email</th>
		          <th >Cargo</th>
		          <th >Teléfono</th>
		          <th >Horas del mes</th>
		          <th >Rol</th>
		          <th >Área</th>
		          <th >Estado</th>
		          <th >Edición</th>
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
		mounted () {
			setTimeout(function(){
				$('#tabla_usuarios').DataTable({
					processing: true,
					serverSide: false,
					stateSave: true,
					'ajax': {
						'url': window._apiURL+"usuarios",
						'type': 'GET',
						'beforeSend': function (request) {
							request.setRequestHeader("Authorization", 'Bearer '+Laravel.api_token);
						}
					},
					deferRender: true,
					columns: [

					{ data: 'nombre', name: 'nombre' },
					{ data: 'apellido', name: 'apellido' },
					{ data: 'email', name: 'email' },
					{ data: 'cargo', name: 'cargo' },
					{ data: 'telefono', name: 'telefono', orderable: false, searchable: false },
					{ data: 'horas_disponible', name: 'horas_disponible', searchable: false },
					{ data: 'roles_id', name: 'roles_id' },
					{ data: 'areas_id', name: 'areas_id' },
					{ data: 'estado', name: 'estado',  orderable: false, searchable: false },
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

						       	return '<a href="usuarios/editar/'+full.id+'" class="btn btn-warning btn-xs usuario_edit"   aria-label="View">Editar</a>';
						       }
						   }
						   ],
						   autoWidth: true,
						   responsive: true,
						   language: {
						   	"sProcessing":     "Procesando...",
						   	"sLengthMenu":     "Mostrar _MENU_ usuarios",
						   	"sZeroRecords":    "No se encontraron resultados",
						   	"sEmptyTable":     "Ningún dato disponible en esta tabla",
						   	"sInfo":           "Mostrando usuarios del _START_ al _END_ de un total de _TOTAL_ usuarios",
						   	"sInfoEmpty":      "Mostrando usuarios del 0 al 0 de un total de 0 usuarios",
						   	"sInfoFiltered":   "(filtrado de un total de _MAX_ usuarios)",
						   	"sInfoPostFix":    "",
						   	"sSearch":         "Buscar:",
						   	"sUrl":            "",
						   	"sInfoThousands":  ",",
						   	"sLoadingRecords": "Cargando...",
						   	"oPaginate": {
						   		"sFirst":    "Primero",
						   		"sLast":     "Último",
						   		"sNext":     "Siguiente",
						   		"sPrevious": "Anterior"
						   	},
						   	"oAria": {
						   		"sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
						   		"sSortDescending": ": Activar para ordenar la columna de manera descendente"
						   	}
						   },
						});
			}, 1);
		},
	}
</script>
