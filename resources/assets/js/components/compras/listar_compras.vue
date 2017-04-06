<template>
		<div class="tarea  table-responsive">

		<table class="table table-striped table-hover datatable-foro table-bordered dataTable no-footer" id="tabla_tareas">
			<thead>
				<tr>
				    <th >Referencía OT</th>
					<th >Tipo Compra </th>
					<th >Estado</th>
					<th >No. transaccion</th>
					<th >Provedor</th>
					<th >Valor</th>
					<th >Moneda</th>
					<th >Descripción</th>
					<th >Acciones</th>
				</tr>
			</thead>

		</table>

		 <form method="POST" id="search-form" class="form-inline" role="form">
	        <div class="drop">
	         	<select name="fee" id="fee"  class="form-control  multiselect">
	        	  <option value="all">Todos</option>
		        	<option value="1">Fee</option>
		        	<option value="0">Puntual</option>
		        </select>
	        </div>
	        <button type="submit" class="btn btn-info btn-flat">Buscar</button>
         </form>

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
			var oTable = $('#tabla_tareas').DataTable({
				dom: "<'row'<'col-xs-12'<'row filtros'<'col-xs-6 col-sm-6 col-lg-4 selects'><'col-xs-6 col-sm-6 col-lg-5'f><'col-xs-4 col-sm-4 col-lg-3'l>>>r>"+
				"<'row'<'col-xs-12't>>"+
				"<'row'<'col-xs-12'<'row'<'col-xs-6'i><'col-xs-6'p>>>>",
				processing: true,
				serverSide: true,
				deferRender: true,
				stateSave: true,
			    ajax: {
					url: window._apiURL+"compras_datatable/",
					type: 'GET',
					beforeSend: function (request) {
						request.setRequestHeader("Authorization", 'Bearer '+Laravel.api_token);
					},
					data: function (d) {
						d.fee = $('select[name=fee]').val();
					},
				},
				columns: [
				{ data: 'ot.referencia', name: 'ot.referencia' },
				{ data: 'tipo_compra.nombre', name: 'tipo_compra.nombre' },
				{ data: 'estado.nombre', name: 'estado.nombre' },
				{ data: 'transaccion', name: 'transaccion' },
				{ data: 'provedor', name: 'provedor' },
				{ data: 'valor', name: 'valor' },
				{ data: 'divisa.nombre', name: 'divisa.nombre' },
				{ data: 'descripcion', name: 'descripcion' },
				{ data: 'acciones', name: 'acciones' }
				],
				columnDefs: [
						   {
						   	"targets": [1],
						   	"data": null,
						       "render": function(data, type, full) { // Devuelve el contenido personalizado
							  
						       	var checked=(data==null)?'No asignado':data;
						       	 return  checked;

						       }
						   },
						   {
						   	"targets": [2],
						   	"data": null,
						       "render": function(data, type, full) { // Devuelve el contenido personalizado
							 
						       	var checked=(data==null)?'No asignado':data;
						       	 return  checked;

						       }
						   },
		
							{ className: "listar_ot_descripcion", "targets": [ 6 ] }

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
				$('#tabla_tareas tbody').on('click', 'td .delete_cliente', function (e) {
					var id = $(this).attr('id');
					id = id.split('-');
					console.log(id[1]);
					$('#id_cliente').val(id[1]);
				})
			});
			// Enviar los datos del filtro personalizado
			$('#search-form').on('submit', function(e) {
				oTable.draw();
				e.preventDefault();
			});

			 // Agregar Selects al dibujar la tabla
		    $('#tabla_tareas').on( 'draw.dt', function () {

				// Agregar las formulario a datatable
				$('#search-form').appendTo('.selects');
			} );

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
        		$('#tabla_tareas').DataTable().ajax.reload();
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
