<template>
	<div>
	
		<table class="table table-striped table-hover  table-bordered dataTable no-footer" id="tabla_usuarios">
		  <thead>
		        <tr>    
		          <th >Nombre</th>
		          <th >Apellidos</th>
		          <th >Email</th>
		          <th >Cargo</th> 
		          <th >Teléfono</th> 
		          <th >Horas Disponibles</th>
		          <th >Rol</th> 
		          <th >Area</th>
		          <th >Estado</th>
		          <th >Edicion</th>  
		        </tr>
		    </thead>
       <!--     <tbody>
            <tr v-for="list_usuario in list_usuarios">
              <td >{{list_usuario.nombre}}</td>
              <td >{{list_usuario.apellido}}</td>
              <td >{{list_usuario.email}}</td>
              <td >{{list_usuario.cargo}}</td>
              <td >{{list_usuario.telefono}}</td>
              <td >{{list_usuario.horas_disponibles}}</td>
              <td >{{list_usuario.roles_id}}</td>
              <td >{{list_usuario.areas_id}}</td>
              <td  v-if="list_usuario.estado == '1'">
              Activo
              </td>
              <td v-else class="danger">
                Inactivo
              </td>
              <td ><button class="btn btn-warning btn-xs" data-toggle="modal" data-target="#myModal_area" @click="pasardatosmodalarea(list_area.id,list_area.nombre,list_area.extencion_tel,list_area.estado)">Editar</button></td>
            </tr>
          </tbody> -->
         
        </table>



	</div>	
</template>

<script>
	
	import table from 'datatables.net';

	
	module.exports={
		data(){
			return{
				list_usuarios:[]
			}
		},
		 created: function(){
	      this.list_usuarios_api();
	    
	     console.log(table);
	       
	     },
	    
		methods:{
			list_usuarios_api: function(){
              this.$http.get('api/v1/usuarios')
              .then(function(respuesta){
                 // this.list_usuarios=respuesta.body;
                 setTimeout(function(){
                 	$('#tabla_usuarios').DataTable({
                 		 processing: true,
				       serverSide: false,
				       ajax: "api/v1/usuarios",
       columns: [
       	   
           { data: 'nombre', name: 'nombre' },
           { data: 'apellido', name: 'apellido' },
           { data: 'cargo', name: 'cargo' },
           { data: 'telefono', name: 'telefono' },
           { data: 'email', name: 'email' },
           { data: 'horas_disponible', name: 'horas_disponible' },
           { data: 'roles_id', name: 'roles_id' },
           { data: 'areas_id', name: 'areas_id' },
           { data: 'estado', name: 'estado' },
           ], 
      columnDefs: [
       {
           "targets": [6],
           "data": null,
           "render": function(data, type, full) { // Devuelve el contenido personalizado
              return (full.roles_id==1)? 'si' : 'no';
                          // return "<a class='btn btn-info' title='Modificar Datos' href='modificar/" + data.id + "'><i class='fa fa-pencil-square-o'></i></a><a class='btn btn-danger' title='Desactivar Usuario'  href='"+ data.id + "'  ><i class='fa fa-ban'></i></a>" ;
                     }
       },
       {
           "targets": [9],
           "data": null,
           "render": function(data, type, full) { // Devuelve el contenido personalizado
                 return'<a href="detalle/'+full.id+'" class="btn btn-info btn-xs"  aria-label="View"><i class="fa fa-eye" aria-hidden="true"></i></a><a href="editar/'+full.id+'" class="btn btn-success btn-xs"  aria-label="Edit"><i class="fa fa-pencil" aria-hidden="true"></i></a>';       
                      
                  }
        }
       ],
       autoWidth: true,
       responsive: true,
       language: {
               "url": "//cdn.datatables.net/plug-ins/1.10.12/i18n/Spanish.json"
           },      

                 	});
                 }, 0);
              });
          }
		}
	}



</script>