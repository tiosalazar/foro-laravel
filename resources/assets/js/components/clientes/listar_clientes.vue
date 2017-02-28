<template >
 <table class="table table-hover " id="app-datatable">
  <tbody>
  <tr>
    <th>NIT</th>
    <th>Cliente</th>
    <th>Nombre de Contacto</th>
    <th>Correo</th>
    <th>Teléfono</th>
    <th></th>
    <th></th>
  </tr>
  <tr v-for="cliente in clientes">

   <td>{{ cliente.nit }}</td>
   <td>{{ cliente.nombre }}</td>
   <td>{{ cliente.nombre_contacto }}</td>
   <td>{{ cliente.email }}</td>
   <td>{{ cliente.telefono }}</td>
   <td><button type="button" class="btn btn-block btn-warning btn-sm edit"  :id="cliente.id" v-on:click="editCliente(cliente)">Editar</button></td>
   <td><button type="button" class="btn btn-block btn-danger btn-sm edit" :id="cliente.id">Borrar</button></td>
 </tr>
</tbody></table>
</template>
<script>

    module.exports =  {
      data () {
          return {
            clientes:[]
          }
      },created:function () {
        this.listarClientes();
      },
      methods:{
          listarClientes: function(){
             this.$http.get(window._apiURL+'clientes')
             .then(function(respuesta){
               this.clientes=respuesta.body;
             });
          },
          editCliente: function(id) {
            this.$parent.$emit('edit-cliente', false)
            $('.editarModal').modal('show');

          },
          /*setCliente: function(client) {
            console.log(this.clientes);
          }*/
    }
  }
</script>
