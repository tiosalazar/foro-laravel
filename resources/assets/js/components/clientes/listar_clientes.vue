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
  <tr v-for="cliente in clientes" href="#" >

   <td>{{ cliente.nit }}</td>
   <td>{{ cliente.nombre }}</td>
   <td>{{ cliente.nombre_contacto }}</td>
   <td>{{ cliente.correo }}</td>
   <td>{{ cliente.telefono }}</td>
   <td><button type="button" class="btn btn-block btn-warning btn-sm edit"  :id="cliente.id">Editar</button></td>
   <td><button type="button" class="btn btn-block btn-danger btn-sm edit" :id="cliente.id">Borrar</button></td>
 </tr>
</tbody></table>
</template>
<script>
    // var $ = require("jquery")(window);
// import 'datatables.net-dt/css/jquery.datatables.css';
    module.exports =  {
      data () {
          return {
            clientes:[]
          }
      }
      ,created: function(){
          this.fetchTips();
      },
      /*,created: function(){
            this.$nextTick(function() {
              $('#app-datatable').DataTable();
            })
          },*/
      methods:{
          fetchTips: function(){
             this.$http.get('api/v1/clientes')
             .then(function(respuesta){
               this.clientes=respuesta.body;
               console.log(respuesta);
             });
          }
    }
  }
</script>