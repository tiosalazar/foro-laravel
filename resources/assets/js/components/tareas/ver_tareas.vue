<template>
	<div>
        <table class="table table-striped table-hover datatable-foro table-bordered dataTable no-footer" id="tabla_tareas">
		  <thead>
		        <tr>    
		          <th >OT</th>
		          <th >Cliente</th>
		          <th >Requerimiento</th>
		          <th >Fecha de Solicitud</th> 
		          <th >Estado</th> 
		          <th >Acciones</th>
		        </tr>
		    </thead>
        </table>
        <form method="POST" id="search-form" class="form-inline" role="form">
			<select_estados tipo_estado="1"  :select="estado" ></select_estados>
			<select name="estados" id="estados">
	        	<!-- <option value="1">1</option>
	        	<option value="2">2</option>
	        	<option value="3">3</option> -->
	        </select>
            <!-- <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" name="nombre_tarea" id="name" placeholder="search name" v-model="estado.id">
            </div> -->

            <button type="submit" class="btn btn-primary">Search</button>
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
				 dom: "<'row'<'col-xs-12'<'col-xs-5 selects'><'col-xs-5'f><'col-xs-2'l>>r>"+
			            "<'row'<'col-xs-12't>>"+
			            "<'row'<'col-xs-12'<'col-xs-6'i><'col-xs-6'p>>>",
				processing: true,
				serverSide: true,
				// ajax: "/api/v1/tareas",
				ajax: {
					url: "/all_tareas/"+that.area,
					data: function (d) {
		                d.nombre_tarea = $('select[name=estados]').val();
						console.log(d.nombre_tarea)
		            },
				},
				columns: [
					{ data: 'ot.referencia', name: 'ot.referencia' },
					{ data: 'ot.cliente.nombre', name: 'ot.cliente.nombre' },
					{ data: 'nombre_tarea', name: 'nombre_tarea' },
					{ data: 'created_at', name: 'created_at' },
				], 
				columnDefs: [
					{
						"targets": [4],
						"data": null,
						   "render": function(data, type, full) { // Devuelve el contenido personalizado
						  	return '<span class="label label-estado estado-'+data.estado.tipos_estados_id+'-'+data.estado.id+' ">'+data.estado.nombre+'</span>';
						       	// return (full.estado==1)? 'Activo' : 'Inactivo';

						     }
					},
					{
						"targets": [5],
						"data": null,
						   "render": function(data, type, full) { // Devuelve el contenido personalizado
						    	return '<a href="ver_tarea/'+full.id+'" class="btn btn-primary btn-xs btn-flat btn-block usuario_edit"   aria-label="View">Ver tarea</a>';        
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
		    	 $.ajax( "/api/v1/estados/1" )
		    	 .done(function(response) {
		    	 	var option;
		    	 	$('#estados')
				    .find('option')
				    .remove()
				    .end()
		    	 	response.forEach(function(item,index) {
		    	 		// option.val(item.id).text(item.nombre);
		    	 		option = $('<option>');
		    	 		option.attr('value', item.id).text(item.nombre);
		    	 		$('#estados').append(option);
		    	 	})
		    	 	$('#estados').appendTo('.selects');

				    console.log(response)
				  })
			    
			} );
		    
		},
		methods:{
			getTareass:function() {},
			list_tareas_api: function(){}
		},

	}
	Vue.component('select_estados',require('../herramientas/select_estado.vue'));
</script>