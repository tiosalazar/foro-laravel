<template>
	<div>

		<table class="table table-striped table-hover datatable-foro table-bordered dataTable no-footer" id="tabla_usuarios">
			<thead>
				<tr>
					<th >Num. OT </th>
					<th >Nombre</th>
					<th >Valor</th>
					<th >Fee</th>
					<th >Horas Totales</th>
					<th >Observaciones</th>
					<th >Fecha Inicio</th>
					<th >Fecha Final</th>
					<th >Cliente</th>
					<th >Usuario</th>
					<th >Estado</th>
					<th >Acciones</th>
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
						    'url': window._apiURL+"ots",
						    'type': 'GET',
						    'beforeSend': function (request) {
						        request.setRequestHeader("Authorization", 'Bearer '+Laravel.api_token);
						    }
						},
						columns: [
						{ data: 'referencia', name: 'referencia' },
						{ data: 'nombre', name: 'nombre' },
						{ data: 'valor', name: 'valor' },
						{ data: 'fee', name: 'fee' },
						{ data: 'horas_totales', name: 'horas_totales' },
						{ data: 'observaciones', name: 'observaciones' },
						{ data: 'fecha_inicio', name: 'fecha_inicio' },
						{ data: 'fecha_final', name: 'fecha_final' },
						{ data: 'cliente.nombre', name: 'cliente' },
						{ data: 'usuario.nombre', name: 'usuario' },
						{ data: 'estado.id', name: 'estado.id' },
						{ data: 'acciones', name: 'acciones', orderable: false, searchable: false }
						],
						columnDefs: [
						   {
							"targets": [3],
							"data": null,
						       "render": function(data, type, full) { // Devuelve el contenido personalizado
                                 var checked=(data==1)?'checked':'';
						       	return  '<input type="radio" " value="'+data+'"  required="required" '+checked+' disabled >';

						       }
						   },
						   {
						   	"targets": [10],
						   	"data": null,
							      "render": function(data, type, full) { // Devuelve el contenido personalizado
							      	return '<span class="label label-estado estado-'+full.estado.tipos_estados_id+'-'+full.estado.id+' ">'+full.estado.nombre+'</span>';
							      // return (full.estado==1)? 'Activo' : 'Inactivo';

							  }
							}

					],
					autoWidth: true,
					responsive: true,
					language: {
						"sProcessing":     "Procesando...",
					    "sLengthMenu":     "Mostrar _MENU_ registros",
					    "sZeroRecords":    "No se encontraron resultados",
					    "sEmptyTable":     "Ningún dato disponible en esta tabla",
					    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
					    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
					    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
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

				}, 0);


			}


		}
	}



</script>
