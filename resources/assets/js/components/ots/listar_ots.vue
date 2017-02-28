<template>
	<div>

		<table class="table table-striped table-hover datatable-foro table-bordered dataTable no-footer" id="tabla_usuarios">
			<thead>
				<tr>
					<th >Num. OT </th>
					<th >Ejecutivo</th>
					<th >Cliente</th>
					<th >Nombre</th>
					<th >FEE</th>
					<th >Fecha Inicio</th>
					<th >Estado</th>
					<th >Horas Totales</th>
					<th >Valor</th>
					<th >Observaciones</th>
					<th >Fecha Final</th>
					<th >Acciones</th>
				</tr>
			</thead>

		</table>

		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Borrar OT</h4>
					</div>
					<div class="modal-body">
						¿ Estas seguro que deseas borrar esta Orden de trabajo ?
						<input type="hidden" name="id" id="id_cliente">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
						<button type="button" v-on:click="borrarCliente(0)" class="btn btn-danger">Borrar</button>
					</div>
				</div>
			</div>
		</div>

	</div>
</template>


<script>

	import table from 'datatables.net';

	module.exports={

		data(){
			return{
				list_usuarios:[],
				boton_hidden:false,
				option_toast:{
					timeOut: 5000,
					"positionClass": "toast-top-center",
					"closeButton": true,
				},
			}
		},
		mounted () {
			$('#tabla_usuarios').DataTable({
				processing: true,
				serverSide: false,
				deferRender: true,
				'ajax': {
					'url': window._apiURL+"ots",
					'type': 'GET',
					'beforeSend': function (request) {
						request.setRequestHeader("Authorization", 'Bearer '+Laravel.api_token);
					}
				},
				columns: [
				{ data: 'referencia', name: 'referencia' },
				{ data: 'usuario.nombre', name: 'usuario' },
				{ data: 'cliente.nombre', name: 'cliente' },
				{ data: 'nombre', name: 'nombre' },
				{ data: 'fee', name: 'fee' },
				{ data: 'fecha_inicio', name: 'fecha_inicio' },
				{ data: 'estado.id', name: 'estado.id' },
				{ data: 'horas_totales', name: 'horas_totales' },
				{ data: 'valor', name: 'valor' },
				{ data: 'observaciones', name: 'observaciones', orderable: false, searchable: false },
				{ data: 'fecha_final', name: 'fecha_final' },
				{ data: 'acciones', name: 'acciones', orderable: false, searchable: false }
				],
				columnDefs: [
				{
					"targets": [8],
					"data": null,
						       "render": function(data, type, full) { // Devuelve el contenido personalizado
						       	return  numeral(data).format('0,0');

						       }
						   },
						   {
						   	"targets": [4],
						   	"data": null,
						       "render": function(data, type, full) { // Devuelve el contenido personalizado
						       	var checked=(data==1)?'checked':'';
						       	return  '<input type="radio" " value="'+data+'"  required="required" '+checked+' disabled >';

						       }
						   },
						   {
						   	"targets": [6],
						   	"data": null,
							      "render": function(data, type, full) { // Devuelve el contenido personalizado
							      	return '<span class="label label-estado estado-'+full.estado.tipos_estados_id+'-'+full.estado.id+' ">'+full.estado.nombre+'</span>';

							  }
							}

							],
							autoWidth: false,
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

			$(document).ready(function(e) {
				$('#tabla_usuarios tbody').on('click', 'td .delete_cliente', function (e) {
					var id = $(this).attr('id');
					id = id.split('-');
					console.log(id[1]);
					$('#id_cliente').val(id[1]);
				})
			});

		},
		methods:{
			borrarCliente: function() {
        let index = $('#id_cliente').val()
        console.log(index);
        this.$http.delete(window._apiURL+'ots/'+index)
        .then(function(response) {
        	if (response.status != '200') {
        		$('#myModal').modal('hide')
        		toastr.error(this.message,response.body.msg,this.option_toast);
        	} else {
        		$('#myModal').modal('hide')
        		toastr.success(response.body.msg,'',this.option_toast);
        		$('#tabla_usuarios').DataTable().ajax.reload();
            // this.clientes.splice(index,1);
        }
    },function(err) {
    	$('#myModal').modal('hide')
    	toastr.error(this.message,err.body.msg,this.option_toast);
    })

    }	


}
}



</script>
