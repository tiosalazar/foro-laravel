<template>
	<div class="tarea  table-responsive">
        <table class="table  table-striped table-hover table-responsive datatable-foro table-bordered dataTable no-footer" role="grid" id="tabla_tareas" cellspacing="0" width="100%">
		  <thead>
		        <tr>
              <th>ID</th>
              <th>Nombre</th>
              <th>Descripcion</th>
              <th>Fecha Ideal Entrega</th>
              <th>Estado</th>
              <th>Encargado</th>
              <th>Acciones</th>
		        </tr>
		    </thead>
        </table>
        <form method="POST" id="search-form" class="form-inline" role="form">
	        <div class="drop">
	        	<select name="year" id="year"  class="form-control multiselect">
		        	<option value="">Año</option>
		        </select>
	        </div>
	        <div class="drop">
	        	<select name="month" id="month"  class="form-control multiselect">
		        	<option value="">Mes</option>
		        	<option value="01">Enero</option>
		        	<option value="02">Febrero</option>
		        	<option value="03">Marzo</option>
		        	<option value="04">Abril</option>
		        	<option value="05">Mayo</option>
		        	<option value="06">Junio</option>
		        	<option value="07">Julio</option>
		        	<option value="08">Agosto</option>
		        	<option value="09">Septiembre</option>
		        	<option value="10">Octubre</option>
		        	<option value="11">Noviembre</option>
		        	<option value="12">Diciembre</option>
		        </select>
	        </div>
            <button type="submit" class="btn btn-info btn-flat">Buscar</button>
        </form>
	</div>
</template>
<script>
	import table from 'datatables.net';
	module.exports={
		props: [],
		data(){
			return{

			}
		},
		created: function(){

			// if ( (typeof(this.area) == 'undefined') || this.area=="" ) {
			// 	this.area = -1;
			// }

		},
		watch:{},
		mounted(){
			let that = this;
			var oTable = $('#tabla_tareas').DataTable({
				 dom: "<'row'<'col-xs-12'<'row filtros'<'col-xs-6 col-sm-6 col-lg-4 selects'><'col-xs-6 col-sm-6 col-lg-5'f><'col-xs-4 col-sm-4 col-lg-3'l>>>r>"+
			            "<'row'<'col-xs-12't>>"+
			            "<'row'<'col-xs-12'<'row'<'col-xs-6'i><'col-xs-6'p>>>>",
				processing: true,
				serverSide: true,
				deferRender: true,
				// ajax: "/api/v1/tareas",
				ajax: {
					url: window._baseURL+"/listar_requerimientos",
					data: function (d) {

		                d.year = $('select[name=year]').val();
		                d.month = $('select[name=month]').val();
		            },

				},
				columns: [
		          { data: 'id', name: 'id' },
		          { data: 'nombre', name: 'nombre' },
		          { data: 'descripcion', name: 'descripcion' },
		          { data: 'fecha_ideal_entrega', name: 'fecha_ideal_entrega' },
		          { data: 'estado.nombre', name: 'estado.nombre' },
		          { data: 'usuario.full_name', name: 'usuario.full_name' },
		          { data: 'action', name: 'action', searchable: false },
          // {data: 'action', name: 'action', orderable: false, searchable: false}
				],
				// order: [[ 6, 'desc' ]],
				columnDefs: [],
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
			// Enviar los datos del filtro personalizado
			$('#search-form').on('submit', function(e) {
		        oTable.draw();
		        e.preventDefault();
		    });
		    // Agregar Selects al dibujar la tabla
		    $('#tabla_tareas').on( 'draw.dt', function () {
		    	// Llamar estados de las taras
				$.ajax( window._baseURL+"/years_historico_equipo" )
		    	.done(function(response) {
		    	 	// limpiar el select
		    	 	var option;
		    	 	$('#year')
				    .find('option')
				    .remove()
				    .end()
				    .append('<option value="">Año</option>')
				    // llenar select dinamicamente
		    	 	response.forEach(function(item,index) {
		    	 		option = $('<option>');
		    	 		option.attr('value', item).text(item);
		    	 		$('#year').append(option);
		    	 	})
				})
				// Agregar las formulario a datatable
				$('#search-form').appendTo('.selects');

			} );

		},
		methods:{

		},

	}
	Vue.component('select_estados',require('../herramientas/select_estado.vue'));
</script>
