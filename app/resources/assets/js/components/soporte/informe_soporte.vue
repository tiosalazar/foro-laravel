<template>
	<div>
		<form method="POST" id="exportar" class="form-inline" role="form">
			<div class="col-md-3 pull-right">
				 <button type="button" @click="exportar_data" class="btn btn-block boton_foro btn-success succes pull-right" >Exportar Datos</button>
			</div>
		</form>
		<div class="clearfix"></div>
	<div class="tarea  table-responsive">

		<!--<form method="POST" id="exportar_datos" class="form-inline" role="form">
				<div class="btn-group">
		       <button type="button" class="btn btn-info" >Exportar</button>
					 <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
		              <span class="caret"></span>
									<span class="sr-only">Toggle Dropdown</span>
					 </button>
					 <ul class="dropdown-menu" role="menu" id="export-menu">
		          <li id="export-to-excel"><a href="#">Formato Excell</a>
					 </ul>
				</div>
		</form>-->
        <table class="table  table-striped table-hover table-responsive datatable-foro table-bordered dataTable no-footer" role="grid" id="tabla_tareas" cellspacing="0" width="100%">
		  <thead>
		        <tr>
		          <th >OT</th>
		          <th >Cliente</th>
		          <th >Requerimiento</th>
							<th >Fase</th>
		          <th >Fecha de solicitud</th>
							<th >Fecha de entrega a cuentas</th>
							<th >Fecha de entrega al cliente</th>
		          <th >Encargado</th>
							<th >Tiempo Real</th>
		          <th >Estado</th>
		          <th >Acciones</th>
		        </tr>
		    </thead>
        </table>
        <form method="POST" id="search-form" class="form-inline" role="form">
	        <div class="drop" v-show="false" >
	        	<select name="estados" id="estados"  class="form-control multiselect">
		        	<option value="">Estados</option>
		        </select>
	        </div>
					<div class="drop-full">
						<select name="estados2" class="js-example-basic-multiple" multiple="multiple" id="estados2">
						</select>
					</div>
					<div class="drop" >
					 <select name="fases" id="fases"  class="form-control multiselect">
						 <option value="">Fases</option>
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
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">Borrar Tarea</h4>
				</div>
				<div class="modal-body">
					¿ Estas seguro que deseas borrar esta Tarea ?
					<input type="hidden" name="id" id="id_cliente">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Cerrar</button>
					<button type="button" v-on:click="borrarCliente(0)" class="btn btn-danger btn-flat">Borrar</button>
				</div>
			</div>
		</div>
	</div>
</div>
</template>
<script>
	import table from 'datatables.net';
	import select2 from 'select2';
	module.exports={
		props: ['area','tipo_fase'],
		data(){
			return{
				list_tareas:[],
				tareas:[],
				estado:{},
				boton_hidden:false,
				option_toast:{
          timeOut: 5000,
          "positionClass": "toast-top-center",
          "closeButton": true,
        },
			}
		},
		created: function(){

			if ( (typeof(this.area) == 'undefined') || this.area=="" ) {
				this.area = -1;
			}
			this.$on('select_estado', function(v) {
				this.estado=v;
			});
		},
		watch:{},
		computed:{

		},
		mounted(){
			let that = this;
			$(".js-example-basic-multiple").select2({ width: '100%',placeholder: 'Estados' });
			var oTable = $('#tabla_tareas').DataTable({
				dom: "<'row'<'col-xs-12'<'row filtros'<'col-xs-6 col-sm-6 col-lg-4 selects'><'col-xs-6 col-sm-6 col-lg-5'f> <'col-xs-4 col-sm-4 col-lg-3'l>>>r>"+
				"<'row'<'col-xs-12't>>"+
				"<'row'<'col-xs-12'<'row'<'col-xs-6'i><'col-xs-6'p>>>>",
				processing: true,
				serverSide: true,
				deferRender: true,
				stateSave: true,
				ajax: {
				url: window._apiURL+"show_tareas_by_fase/",
				type: 'GET',
				beforeSend: function (request) {
					request.setRequestHeader("Authorization", 'Bearer '+Laravel.api_token);
				},
				data: function (d) {
					d.estados = $('select[name=estados2]').val();
					d.fases = $('select[name=fases]').val();
					d.year = $('select[name=year]').val();
					d.month = $('select[name=month]').val();
				},
			},
				columns: [
				{ data: 'ot.referencia', name: 'ot.referencia' },
				{ data: 'ot.cliente.nombre', name: 'ot.cliente.nombre' },
				{ data: 'nombre_tarea', name: 'nombre_tarea' },
				{ data: 'fases', name: 'fases' },
				{ data: 'created_at', name: 'created_at' },
				{ data: 'fecha_entrega_cuentas', name: 'fecha_entrega_cuentas' },
				{ data: 'fecha_entrega_cliente', name: 'fecha_entrega_cliente' },
				{ data: 'encargado', name: 'usuarioencargado.full_name' },
				{ data: 'tiempo_real', name: 'tiempo_real' },
				{ data: 'estado', name: 'estado.nombre' },
				{ data: 'acciones', name: 'acciones', searchable:false },
				],
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
			setInterval( function () {
		    oTable.ajax.reload();
			}, 300000 );
			// Enviar los datos del filtro personalizado
			$('#search-form').on('submit', function(e) {
				oTable.draw();
				e.preventDefault();
			});
		    // Agregar Selects al dibujar la tabla
		    $('#tabla_tareas').on( 'draw.dt', function () {
		    // Llamar estados de las taras
				$.ajax({ url:window._apiURL+"estados_x_tareas/1",headers: {
	 				 'Authorization':'Bearer '+Laravel.api_token}})
		    .done(function(response) {
					//console.log(response);
		    	 	// limpiar el select
						if ($('select[name=estados]').val() == "" && $('select[name=estados2]').val() == "") {
			    	 	var option;
			    	 	$('#estados,#estados2')
			    	 	.find('option')
			    	 	.remove()
			    	 	.end()
					    // llenar select dinamicamente
					    response.forEach(function(item,index) {
					    	option = $('<option>');
					    	option.attr('value', item.id).text(item.nombre);
					    	$('#estados,#estados2').append(option);
					    })
						}


				});

				$.ajax({ url:window._apiURL+"fases_x_tipo/"+that.tipo_fase,headers: {
				 'Authorization':'Bearer '+Laravel.api_token}})
			 .done(function(response) {
					 // limpiar el select
					 if ($('select[name=fases]').val() == "") {
					 var option;
					 $('#fases')
					 .find('option')
					 .remove()
					 .end()
					 .append('<option value="">Fases</option>')
					 // llenar select dinamicamente
					 response.forEach(function(item,index) {
						 option = $('<option>');
						 option.attr('value', item.id).text(item.nombre);
						 $('#fases').append(option);
					 })
				 }
			 })

		    $.ajax( window._baseURL+"/years_tarea" )
		    .done(function(response) {
		    	 	// limpiar el select
						if ($('select[name=year]').val() == "") {
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
					}
				})
				// Agregar las formulario a datatable
				$('#search-form').appendTo('.selects');
				//$('#exportar_datos').appendTo('.button_exportar');

			} );
			$(document).ready(function(e) {
				$('#tabla_tareas tbody').on('click', 'td .delete_cliente', function (e) {
					var id = $(this).attr('id');
					id = id.split('-');
					$('#id_cliente').val(id[1]);
				})
			});

		},
		methods:{
			exportar_data: function() {
				var arrayData={
					estado:($('select[name=estados2]').val() != "")? $('select[name=estados2]').val() :'null',
					fase : ($('select[name=fases]').val() != "")?$('select[name=fases]').val():'null',
					year : ($('select[name=year]').val() != "")?$('select[name=year]').val():'null',
					month :($('select[name=month]').val()!= "")?$('select[name=month]').val():'null'
				};

				window.location = window._baseURL+'/informes/soporte/exportar/'+encodeURI(arrayData.estado)+'/'+
				arrayData.fase+'/'+arrayData.year+'/'+arrayData.month;

			},
			borrarCliente: function() {
        let index = $('#id_cliente').val()
        console.log(index);
        this.$http.delete(window._apiURL+'tareas/'+index)
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
		},

	}
	Vue.component('select_estados',require('../herramientas/select_estado.vue'));
</script>
