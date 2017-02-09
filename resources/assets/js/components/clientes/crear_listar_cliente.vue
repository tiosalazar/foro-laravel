<template >
  <div>

    <section class="col-md-12">
    </section>
    <section class="col-xs-12">
         <table class="table table-bordered table-striped table-hover datatable-foro" id="tabla_clientes">
          <thead>
            <tr>    
              <th>NIT</th>
              <th>Cliente</th>
              <th>Nombre de Contacto</th>
              <th>Correo</th>
              <th>Teléfono</th>
              <th>Acciones</th>
            </tr>
        </thead>
        </table>
   </section> 
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
      $('#tabla_clientes').DataTable({
                     processing: true,
               serverSide: false,
               ajax: "api/v1/clientes",
               columns: [

                   { data: 'nit', name: 'nit' },
                   { data: 'nombre', name: 'nombre' },
                   { data: 'nombre_contacto', name: 'nombre_contacto' },
                   { data: 'email', name: 'email' },
                   { data: 'telefono', name: 'telefono' },
                   ], 
              columnDefs: [
               {
                   "targets": [5],
                   "data": null,
                   "render": function(data, type, full) { // Devuelve el contenido personalizado
                    console.log(data)
                      return '<a href="editar_cliente/'+full.id+'" class="btn btn-primary btn-xs btn-flat btn-block usuario_edit">Editar</a><a href="editar_cliente/'+full.id+'" class="btn btn-danger btn-xs btn-flat btn-block usuario_edit" >Borrar</a>'; 
                    }
               },
               ],
               autoWidth: true,
               responsive: true,
               language: {
                       "url": "//cdn.datatables.net/plug-ins/1.10.12/i18n/Spanish.json"
                   },      

                    });
    },
    methods:{
      setErrors:function(object) {
        this.message='';
        var that = this;
        $.each(object, function(index, value) {
          that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
          that.errors_return[index] = 'has-warning';
        });
      },
      clearCliente:function(e) {
        console.log(this.cliente);
        this.cliente = {};
      },
      listarClientes: function(){
         this.$http.get('api/v1/clientes')
         .then(function(respuesta){
           this.clientes=respuesta.body;
           console.log(this.clientes);
         });
      },
      editCliente: function(client) {
        this.$http.put('api/v1/clientes/'+client.id, client)
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
      borrarCliente: function(client,index) {
        this.$http.delete('api/v1/clientes/'+client.id)
        .then(function(response) {
          if (response.status != '200') {
            if (Object.keys(response.body.obj).length>0) {
              this.setErrors(response.body.obj);
            }
            toastr.warning(this.message,response.body.msg,this.option_toast);
          } else {
            toastr.success(response.body.msg,'',this.option_toast);
            this.clientes.splice(index,1);
          }
        },function(err) {
          if (Object.keys(err.body.obj).length>0) {
            this.setErrors(err.body.obj);
          }
          toastr.error(this.message,err.body.msg,this.option_toast);
        })
      }
  }
}
</script>