<template>
	<div>
		<form method="POST" id="exportar" class="form-inline" role="form">
			<div class="col-md-3 pull-right">
				<button type="button" @click="exportar_data" class="btn btn-block boton_foro btn-success succes pull-right" >Exportar Datos</button>
				<button type="button" @click="exportar_tareas" class="btn btn-block boton_foro btn-success succes pull-right" >Exportar Tareas</button>
			</div>
		</form>
		<div class="clearfix"></div>
		<div class="tarea  table-responsive">

			<table class="table table-striped table-hover datatable-foro table-bordered dataTable no-footer" id="tabla_tareas">
				<thead>
					<tr>
						<th >Seleccionar</th>
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

			<form method="POST" id="search-form" class="form-inline" role="form">
				<input type="hidden" id="arrayCheck" value="">
				<div class="drop select_fecha_trafico1">
					<datepicker language="es"
					id="fecha_inicio"
					required="required" v-validate data-vv-rules="required"
					@input="guardarDatos"
					:disabled="disabled"
					data-vv-as="Fecha de Inicio"
					placeholder="Fecha Inicio desde"
					v-model="fechas.to"
					name="fecha_inicio"
					class="form-control"
					format="dd-MM-yyyy">
				</datepicker>
				<input type="hidden" name="f_inicio" v-model="start">
			</div>
			<div class="drop select_fecha_trafico2">
				<datepicker language="es"
				id="fecha_final"
				required="required" v-validate data-vv-rules="required"
				@input="guardarDatos"
				:disabled="disabled"
				data-vv-as="Fecha Final"
				placeholder="Fecha Inicio hasta"
				v-model="fechas.from"
				name="fecha_final"
				class="form-control"
				format="dd-MM-yyyy">
			</datepicker>
			<input type="hidden" name="f_final" v-model="end">
		</div>
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
</div>
</template>
<style>
.select_fecha_trafico1,.select_fecha_trafico2{
	display: inline-flex;
	width: 49%;
}
.select_fecha_trafico1 input#fecha_inicio,.select_fecha_trafico2 input#fecha_final{
	width: 100%;
}
</style>

<script>

import table from 'datatables.net';
import Datepicker from 'vuejs-datepicker';
import moment from 'moment';

module.exports={
	components: {Datepicker},
	props: [],
	data(){
		return{
			list_usuarios:[],
			boton_hidden:false,
			disabled:{
				// from:moment().toDate(),
				from:'',
			},
			fechas:{
				to:'',
				from:'',
			},
			start:'',
			end:'',
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
				url: window._apiURL+"ots_datatable/",
				type: 'GET',
				beforeSend: function (request) {
					request.setRequestHeader("Authorization", 'Bearer '+Laravel.api_token);
				},
				data: function (d) {
					d.fee = $('select[name=fee]').val();
					d.f_inicio = $('input[name=f_inicio]').val();
					d.f_final = $('input[name=f_final]').val();
				},
			},
			columns: [
				{ data: 'select', name: 'select', orderable: false, searchable: false },
				{ data: 'referencia', name: 'referencia',orderable: true, searchable: true },
				{ data: 'usuario.nombre', name: 'usuario.nombre' },
				{ data: 'cliente.nombre', name: 'cliente.nombre' },
				{ data: 'nombre', name: 'nombre' },
				{ data: 'fee', name: 'fee', orderable: false, searchable: false },
				{ data: 'fecha_inicio', name: 'fecha_inicio' },
				{ data: 'estado.id', name: 'estado.nombre' },
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
						return  numeral(data).format('$0,0');

					}
				},
				{
					"targets": [9],
					"render": function(data, type, full) { // Devuelve el contenido personalizado

						if(data!=""){
							var observacion_corta = data.substr(0, 30);

							return  observacion_corta+"...";
						}else{
							return "";
						}


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
				},
				{ className: "listar_ot_descripcion", "targets": [ 9 ] }

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
			var arrayCheck=[];
			$('#tabla_tareas tbody').on('click', 'td .delete_cliente', function (e) {
				var id = $(this).attr('id');
				id = id.split('-');
				$('#id_cliente').val(id[1]);
			})
			//Al dar click en un select lo almacena en un arreglo. el cual luego será pasado para exportar.
			 $('#tabla_tareas tbody').on('click','td input[type="checkbox"]', function (e) {
				   if($.inArray($(this).val(), arrayCheck) < 0){
							arrayCheck.push($(this).val());
					 }else{
						 arrayCheck.splice( $.inArray($(this).val(), arrayCheck), 1 );
					 }
					 $('#arrayCheck').val(arrayCheck);
			 });
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

			// Agregar las formulario a datatable
			$('#search-form').appendTo('.selects');

			//Funcion para marcar los checks cuando cargue la tabla.
      var arrayCheckTemp= $('#arrayCheck').val().split(",");
			$( "input[type='checkbox']" ).each(function() {
				if($.inArray($(this).val(), arrayCheckTemp) >= 0){
					$(this).prop("checked", "checked");
				}
			});

		});



	},
	methods:{
		exportar_data: function() {
			var arrayData={
				fee:($('select[name=fee]').val() != "")? $('select[name=fee]').val() :'null',
				f_inicio : ($('input[name=f_inicio]').val() != "")?moment($('input[name=f_inicio]').val()).format('YYYY-MM-DD'):'null',
				f_final : ($('input[name=f_final]').val() != "")?moment($('input[name=f_final]').val()).format('YYYY-MM-DD'):'null'
			};
			/*console.log(window._baseURL+'/ots/listado/exportar/'+arrayData.fee+'/'+
			arrayData.f_inicio+'/'+arrayData.f_final);*/

			window.location = window._baseURL+'/ots/listado/exportar/'+arrayData.fee+'/'+
			arrayData.f_inicio+'/'+arrayData.f_final;
		},
		exportar_tareas:function () {
			 window.location =window._baseURL+'/ots/exportar/tareas/'+ $('#arrayCheck').val();
		},
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

		},
		guardarDatos:function () {
			if (this.fechas.to !== '') {
				this.start = moment(this.fechas.to).format('YYYY-MM-DD');
			}
			if (this.fechas.from!=='') {
				this.end = moment(this.fechas.from).add(23,'h').add(59,'m').add(59,'s').format('YYYY-MM-DD H:m:s');
			}
		}


	}
}



</script>
