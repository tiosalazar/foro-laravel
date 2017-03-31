<template>
	<div class="tarea  table-responsive trafico">
        <table class=" table  table-striped table-hover table-responsive datatable-foro table-bordered dataTable no-footer " role="grid" id="tabla_tareas" cellspacing="0" width="100%">
		  <thead>
		        <tr>
		          <th >OT</th>
		          <th >Cliente</th>
		          <th >Ejecutivo</th>
							<th >Encargado</th>
							<th >Fecha de Solicitud</th>
		          <th >Requerimiento</th>
		          <th >Fecha Entrega Área</th>
		          <th >Fecha Entrega Cuentas</th>
							<th >Estado</th>
							<th >Estado Tr&aacute;fico</th>
							<th >Comentarios</th>
		          <th >Acciones</th>
		        </tr>
		    </thead>
        </table>
        <form method="POST" id="search-form" class="form-inline" role="form">
					<div class="drop">
						<datepicker language="es"
							id="fecha_inicio"
							required="required" v-validate data-vv-rules="required"
							@input="guardarDatos"
							:disabled="disabled"
							data-vv-as="Fecha de Inicio"
							placeholder="Fecha Inicio"
							v-model="fechas.to"
							name="fecha_inicio"
							class="form-control"
							format="dd-MM-yyyy">
						</datepicker>
						<input type="hidden" name="f_inicio" v-model="start">
					</div>
					<div class="drop">
						<datepicker language="es"
							id="fecha_final"
							required="required" v-validate data-vv-rules="required"
							@input="guardarDatos"
							:disabled="disabled"
							data-vv-as="Fecha Final"
							placeholder="Fecha Final"
							v-model="fechas.from"
							name="fecha_final"
							class="form-control"
							format="dd-MM-yyyy">
						</datepicker>
						<input type="hidden" name="f_final" v-model="end">
					</div>
            <button type="submit" class="btn btn-info btn-flat">Buscar</button>
        </form>
	</div>
</template>
<script>
	import table from 'datatables.net';
	import Datepicker from 'vuejs-datepicker';
	import moment from 'moment';
	module.exports={
		components: {Datepicker},
		props: [],
		data(){
			return{
				list_tareas:[],
				tareas:[],
				estado:{},
				boton_hidden:false,
				disabled:{
					from:moment().toDate(),
				},
				fechas:{
					to:'',
					from:'',
				},
				start:'',
				end:'',
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
		computed:{},
		mounted(){
			let that = this;
			var oTable = $('#tabla_tareas').DataTable({
				dom: "<'row'<'col-xs-12'<'row filtros'<'col-xs-6 col-sm-6 col-lg-4 selects'><'col-xs-6 col-sm-6 col-lg-5'f><'col-xs-4 col-sm-4 col-lg-3'l>>>r>"+
				"<'row'<'col-xs-12't>>"+
				"<'row'<'col-xs-12'<'row'<'col-xs-6'i><'col-xs-6'p>>>>",
				processing: true,
				serverSide: true,
				deferRender: true,
				ajax: {
					url: window._baseURL+"/trafico",
					data: function (d) {
						d.f_inicio = $('input[name=f_inicio]').val();
						d.f_final = $('input[name=f_final]').val();
					},

				},
				columns: [
				{ data: 'ot.referencia', name: 'ot.referencia', searchable: false },
				{ data: 'ot.cliente.nombre', name: 'ot.cliente.nombre', searchable: false },
				{ data: 'ejecutivo', name: 'usuario.nombre', searchable: false },
				{ data: 'usuarioencargado.nombre', name: 'usuarioencargado.nombre' },
				{ data: 'created_at', name: 'created_at', searchable: false },
				{ data: 'nombre_tarea', name: 'nombre_tarea', searchable: false },
				{ data: 'fecha_entrega_area', name: 'fecha_entrega_area', searchable: false },
				{ data: 'fecha_entrega_cuentas', name: 'fecha_entrega_cuentas', searchable: false },
				{ data: 'estado', name: 'estado.nombre', searchable: false },
				{ data: 'estados_trafico', name: 'estados_trafico', searchable: false },
				{ data: 'comentario', name: 'comentario', orderable: false, searchable: false },
				{ data: 'actions', name: 'actions', orderable: false, searchable: false },
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

				$('#tabla_tareas tbody').on('click','.save_trafic',function (e) {
					e.preventDefault();
					// Obtener id del elemento
					var id = $(this).attr('id');
					id = id.replace( /^\D+/g, '');
					var data = {estado_trafico:$('#estados_trafico'+id).val(),comentario:$('#comentario'+id).val()};
					var toastr_opt = {timeOut: 5000, "positionClass": "toast-top-center","closeButton": true,}
					// Actualziar tarea en trafico
					$.ajax( {url: window._apiURL+"save_trafic/"+id,
									type:'POST' ,
									data:data,
									beforeSend: function (request) { request.setRequestHeader("Authorization", 'Bearer '+Laravel.api_token) }
								})
			    .done(function(response) {
						toastr.success(response.msg,'',toastr_opt);
					}).fail(function(response) {
						if (response.status==404) {
							response.msg = 'No se encontro la ruta';
						}
				    toastr.error(response.msg,'Error',toastr_opt);
				  });
				})
			// Enviar los datos del filtro personalizado
			$('#search-form').on('submit', function(e) {
				oTable.draw();
				e.preventDefault();
			});
		    // Agregar Selects al dibujar la tabla
		    $('#tabla_tareas').on( 'draw.dt', function () {
		    // Llamar estados de las tareas

        $.ajax( window._baseURL+"/week_of_year" )
		    .done(function(response) {
		    	 	// limpiar el select
		    	 	let option;
		    	 	$('#week')
		    	 	.find('option')
		    	 	.remove()
		    	 	.end()
		    	 	.append('<option value="">Semana</option>')
				    // llenar select dinamicamente
				    response.forEach(function(item,index) {
				    	option = $('<option>');
				    	option.attr('value', item).text(item);
				    	$('#week').append(option);
				    })
            $('#week option:last-child').attr('selected','selected')
				})
				// Agregar las formulario a datatable
				$('#search-form').appendTo('.selects');
			} );

		},
		methods:{
			guardarDatos:function () {
				if (this.fechas.to !== '') {
					this.start = moment(this.fechas.to).format('YYYY-MM-DD');
				}
				if (this.fechas.from!=='') {
					this.end = moment(this.fechas.from).add(23,'h').add(59,'m').add(59,'s').format('YYYY-MM-DD H:m:s');
				}
			}
		},

	}
	Vue.component('select_estados',require('../herramientas/select_estado.vue'));
</script>
