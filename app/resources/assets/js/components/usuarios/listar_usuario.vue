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
				var oTable = $('#tabla_usuarios').DataTable({
					processing: true,
					serverSide: true,
					stateSave: true,
					'ajax': {
						'url': window._apiURL+"index_datatables",
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
					{ data: 'rol.display_name', name: 'rol.display_name' },
					{ data: 'area.nombre', name: 'area.nombre' },
					{ data: 'estado', name: 'estado',  orderable: false, searchable: false },
					{ data: 'acciones', name: 'acciones',  orderable: false, searchable: false },
					],
					columnDefs: [],
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
			setInterval( function () {
		    oTable.ajax.reload();
			}, 300000 );
		},
	}
</script>
