<template >
  <div>
  <section class="col-xs-12 ">
<div class="row">
        <div class="col-xs-12">
          <div class="box box-primary" >
            <!-- /.box-header -->
            <div class="box-header with-border">
              <h3 class="box-title">Listado de Clientes</h3>
            </div>
            <div class="box-body table-responsive ">
                 <table class="table   datatable-foro table-bordered dataTable no-footer" role="grid" id="tabla_clientes" cellspacing="0" width="100%">
          <thead>
            <tr>
              <th>NIT</th>
              <th>Cliente</th>
              <th>Razón social</th>
              <th>Ejecutivo</th>
              <th>Nombre de Contacto</th>
              <th>Correo</th>
              <th>Teléfono</th>
              <th>Acciones</th>
            </tr>
        </thead>
        </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>
 </section>
    <section class="col-xs-12 ">

   </section>
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Borrar Cliente</h4>
      </div>
      <div class="modal-body">
        ¿ Estas seguro que deseas borrar este cliente ?
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
</template>
<script>

  import VeeValidate, { Validator } from 'vee-validate';

  Vue.use(VeeValidate);
  module.exports =  {
    components: {VeeValidate,Validator},

    data () {
      return {
        clientes:[],
        cliente:{},
        message :'',
        agregar:true,
        table:'',
        option_toast:{
          timeOut: 5000,
          "positionClass": "toast-top-center",
          "closeButton": true,
        },
        errors_return:{
          'nombre':'',
          'nit':'',
          'nombre_contacto':'',
          'telefono':'',
          'email':'',
        }
      }
    },created:function () {
      this.listarClientes();
      this.$on('edit-cliente', function(obj) {
        this.agregar= obj;
      });
    },
    mounted() {
      $(document).ready(function(e) {
        $('#tabla_clientes tbody').on('click', 'td .delete_cliente', function (e) {
              var id = $(this).attr('id');
              id = id.split('-');
              $('#id_cliente').val(id[1]);

        })
      })
      var tableClientes = $('#tabla_clientes').DataTable({
              processing: true,
              serverSide: true,
              deferRender: true,
              stateSave: true,
              'ajax': {
                 'url': window._apiURL+"clientes",
                 'type': 'GET',
                 'beforeSend': function (request) {
                     request.setRequestHeader("Authorization", 'Bearer '+Laravel.api_token);
                 }
             },
              columns: [

                  { data: 'nit', name: 'nit' },
                  { data: 'nombre', name: 'nombre' },
                  { data: 'razon_social', name: 'razon_social' },
                  { data: 'ejecutivo', name: 'ejecutivo' },
                  { data: 'nombre_contacto', name: 'nombre_contacto' },
                  { data: 'email', name: 'email' },
                  { data: 'telefono', name: 'telefono' },
                  {data: 'action', name: 'action', orderable: false, searchable: false}
              ],
              columnDefs: [
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
    ready: function(){},
    methods:{
      setErrors:function(object) {
        this.message='';
        var that = this;
        $.each(object, function(index, value) {
          let campo = index.replace(/_id/g, '');
          campo = campo.replace(/_/g, ' ');
          value = value[0].replace(/ id /g, '');
          that.message += '<strong>'+campo + '</strong>: '+value+ '</br>';
          that.errors_return[index] = 'has-warning';
        });
      },
      clearCliente:function(e) {
        console.log(this.cliente);
        this.cliente = {};
      },
      listarClientes: function(){
         this.$http.get(window._apiURL+'clientes')
         .then(function(respuesta){
           this.clientes=respuesta.body;
           console.log(this.clientes);
         });
      },
      editCliente: function(client) {
        this.$http.put(window._apiURL+'clientes/'+client.id, client)
        .then(function(response) {
          if (response.status != '200') {
            if (Object.keys(response.body.obj).length>0) {
              this.setErrors(response.body.obj);
            }
            toastr.warning(this.message,response.body.msg,this.option_toast);
          } else {
            $('.editarModal').modal('hide');
            toastr.success(response.body.msg,'',this.option_toast);
          }
        }, function(err) {
          if (Object.keys(err.body.obj).length>0) {
            this.setErrors(err.body.obj);
          }
          toastr.error(this.message,err.body.msg,this.option_toast);
        })
      },
      borrarCliente: function() {
        // this.$http.delete('api/v1/clientes/'+client.id)
        let index = $('#id_cliente').val();
        var that = this;
        this.$http.delete(window._apiURL+'clientes/'+index)
        .then(function(response) {
          if (response.status != '200') {
            if (Object.keys(response.body.obj).length>0) {
              this.setErrors(response.body.obj);
            }
            $('#myModal').modal('hide')
            toastr.warning(this.message,response.body.msg,this.option_toast);
          } else {
            $('#myModal').modal('hide')
            toastr.success(response.body.msg,'',this.option_toast);
            this.table.ajax.reload();
          }
        },function(err) {
          if (err.status == 404) {
            $('#myModal').modal('hide')
            toastr.error('No se encontraron resultados, verfique la informacion','Error',this.option_toast);
          } else {
            console.log(err);
            if (Object.keys(err.body.obj).length>0) {
              this.setErrors(err.body.obj);
            }else{
              that.message = err.body.error;
            }
            toastr.error(err.body.msg,this.message,this.option_toast);
            $('#myModal').modal('hide')
          }
        })
      }
  }
}
</script>
