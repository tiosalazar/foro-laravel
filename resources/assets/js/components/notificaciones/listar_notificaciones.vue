<template >
 <section class="col-xs-12">
   <table class="table table-bordered table-striped table-hover datatable-foro" id="tabla_clientes">
    <thead>
      <tr>
        <th>Nombre</th>
        <th>Cargo</th>
        <th>Descripción</th>
        <th>Fecha</th>
        <th>Acciones</th>
      </tr>
    </thead>
  </table>
</section>
</template>
<script>

  module.exports =  {
    data () {
      return {
        clientes:[],
        option_toast:{
          timeOut: 5000,
          "positionClass": "toast-top-center",
          "closeButton": true,
        },
      }
    },created:function () {
      this.listarClientes();
    },
    mounted(){
      var tableClientes = $('#tabla_clientes').DataTable({
        processing: true,
        serverSide: true,
        'ajax': {
         'url': window._baseURL+"/notificaciones",
         'type': 'GET',
         'beforeSend': function (request) {
           request.setRequestHeader("Authorization", 'Bearer '+Laravel.api_token);
         }
       },
       columns: [

       { data: 'data.nombre', name: 'nombre' },
       { data: 'data.cargo', name: 'cargo' },
       { data: 'data.descripcion', name: 'descripcion' },
       { data: 'data.created_at', name: 'created_at' },
       ],
       columnDefs: [
       {
        "targets": [4],
        "data": null,
               "render": function(data, type, full) { // Devuelve el contenido personalizado
                return '<a href="'+_baseURL+data.data.link+'" class="btn btn-primary btn-xs btn-flat btn-block"   aria-label="View">Ver item</a>';
              }
            }
            ],
            autoWidth: true,
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
      this.table = tableClientes;
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
  }
}
    </script>
