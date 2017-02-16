<template>
	<div class="tarea">
        <table class="table table-striped table-hover datatable-foro table-bordered dataTable no-footer" id="tabla_tareas">
		  <thead>
		        <tr>    
		          <th >OT</th>
		          <th >Cliente</th>
		          <th >Requerimiento</th>
		          <th >Fecha de Solicitud</th> 
		          <th >Encargado</th> 
		          <th >Estado</th> 
		          <th >Acciones</th>
		        </tr>
		    </thead>
        </table>
        <form method="POST" id="search-form" class="form-inline" role="form">
	        <div class="drop">
	        	<select name="estados" id="estados"  class="form-control multiselect">
		        	<option value="">Estados</option>
		        </select>
	        </div>
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
		props: ['area'],
		data(){
			return{
				list_tareas:[],
				tareas:[],
				estado:{},
				boton_hidden:false,
			}
		},
		created: function(){
			this.list_tareas_api();
			this.getTareass();
			if (typeof(this.area) == 'undefined') {
				this.area = -1;
			}
			this.$on('select_estado', function(v) {
				this.estado=v;
			});
		},
		watch:{},
		mounted() {
			let that = this;
			var oTable = $('#tabla_tareas').DataTable({
				 dom: "<'row'<'col-xs-12'<'row filtros'<'col-xs-4 selects'><'col-xs-6'f><'col-xs-2'l>>>r>"+
			            "<'row'<'col-xs-12't>>"+
			            "<'row'<'col-xs-12'<'row'<'col-xs-6'i><'col-xs-6'p>>>>",
				processing: true,
				serverSide: true,
				// ajax: "/api/v1/tareas",
				ajax: {
					url: "/all_tareas/"+that.area,
					data: function (d) {
		                d.estados = $('select[name=estados]').val();
		                d.year = $('select[name=year]').val();
		                d.month = $('select[name=month]').val();
		            },
				},
				columns: [
					{ data: 'ot.referencia', name: 'ot.referencia' },
					{ data: 'ot.cliente.nombre', name: 'ot.cliente.nombre' },
					{ data: 'nombre_tarea', name: 'nombre_tarea' },
					{ data: 'created_at', name: 'created_at' },
					{ data: 'usuarioencargado.nombre', name: 'usuarioencargado.nombre' },
				], 
				columnDefs: [
					{
						"targets": [5],
						"data": null,
						   "render": function(data, type, full) { // Devuelve el contenido personalizado
						  	return '<span class="label label-estado estado-'+data.estado.tipos_estados_id+'-'+data.estado.id+' ">'+data.estado.nombre+'</span>';

						     }
					},
					{
						"targets": [6],
						"data": null,
						   "render": function(data, type, full) { // Devuelve el contenido personalizado
						    	return '<a href="/ver_tarea/'+full.id+'" class="btn btn-primary btn-xs btn-flat btn-block"   aria-label="View">Ver tarea</a>';        
						   	}
					}
				],
				autoWidth: true,
				responsive: true,
				language: {
					"url": "//cdn.datatables.net/plug-ins/1.10.12/i18n/Spanish.json"
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
		    	$.ajax( "/api/v1/estados/1" )
		    	.done(function(response) {
		    	 	// limpiar el select
		    	 	var option;
		    	 	$('#estados')
				    .find('option')
				    .remove()
				    .end()
				    .append('<option value="">Estados</option>')
				    // llenar select dinamicamente
		    	 	response.forEach(function(item,index) {
		    	 		option = $('<option>');
		    	 		option.attr('value', item.id).text(item.nombre);
		    	 		$('#estados').append(option);
		    	 	})
				})
				$.ajax( "/years_tarea" )
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
			getTareass:function() {},
			list_tareas_api: function(){}
		},

	}
	Vue.component('select_estados',require('../herramientas/select_estado.vue'));
</script>