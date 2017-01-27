<template >
  <div>

    <section class="col-md-12">
      <!-- <div class="row"> -->
      <div class="box box-default collapsed-box collapse-cliente">
        <div class="box-header with-border">
          <h3 class="box-title">Agregar Cliente</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
          </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <form class="row" name="agregar_cliente" id="agregar_cliente">
            <div class="col-md-6">
              <div class="form-group" v-bind:class="errors.nombre">
                <label>Nombre {{errors.nombre}}</label>
                <input type="text" v-model="cliente.nombre" name="nombre" id="nombre" class="form-control" required="required">
              </div>
              <!-- /.form-group -->
              <div class="form-group" v-bind:class="errors.nombre_contacto">
                <label>Nombre de Contacto</label>
                <input type="text" v-model="cliente.nombre_contacto" name="nombre_contacto" id="nombre_contacto" class="form-control">
              </div>
              <!-- /.form-group -->
            </div>
            <!-- /.col -->
            <div class="col-md-6">
              <div class="form-group" v-bind:class="errors.nit">
                <label>NIT</label>
                <input type="text" v-model="cliente.nit" name="nit" id="nit" class="form-control" required="required">
              </div>
              <!-- /.form-group -->
              <div class="form-group" v-bind:class="errors.email">
                <label>Correo</label>
                <input type="email" v-model="cliente.email" name="email" id="email" class="form-control">
              </div>
              <!-- /.form-group -->
            </div>
            <!-- /.col -->
            <div class="col-md-6">
              <div class="form-group" v-bind:class="errors.telefono">
                <label>Teléfono</label>
                <input type="text" v-model="cliente.telefono" name="telefono" id="telefono" class="form-control">
              </div>
              <!-- /.form-group -->
            </div>
            <div class="col-md-6">
              <button type="button"  v-on:click="addCliente" class="btn btn-block btn-success aa">Agregar</button>
            </div>
          </form>
        </div>
        <!-- /.box-body -->
      </div>
      <!-- </div> -->
      <!-- ./ row -->
    </section>
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Clientes</h3>

          <div class="box-tools">
            <div class="input-group input-group-sm" style="width: 150px;">
              <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

              <div class="input-group-btn">
                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
              </div>
            </div>
          </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body table-responsive no-padding">
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
            <tr v-for="(cliente, index) in clientes">

             <td>{{ cliente.nit }}</td>
             <td>{{ cliente.nombre }}</td>
             <td>{{ cliente.nombre_contacto }}</td>
             <td>{{ cliente.email }}</td>
             <td>{{ cliente.telefono }}</td>
             <td><button type="button" class="btn btn-block btn-warning btn-sm edit"  :id="cliente.id" v-on:click="openModal(cliente)">Editar</button></td>
             <td><button type="button" class="btn btn-block btn-danger btn-sm edit" :id="cliente.id" v-on:click="borrarCliente(cliente,index)">Borrar</button></td>
           </tr>
         </tbody></table>
       </div>
       <!-- /.box-body -->
     </div>
     <!-- /.box -->
   </div> 
   <div class="modal editarModal" >
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span></button>
            <h4 class="modal-title">Editar Cliente</h4>
          </div>
          <div class="modal-body">
            <form class="row" name="agregar_cliente" id="agregar_cliente">
              <div class="col-md-6">
                <div class="form-group" v-bind:class="errors.nombre">
                  <label>Nombre</label>
                  <input type="text" v-model="cliente.nombre" name="nombre" id="nombre" class="form-control" required="required">
                </div>
                <!-- /.form-group -->
                <div class="form-group" v-bind:class="errors.nombre_contacto">
                  <label>Nombre de Contacto</label>
                  <input type="text" v-model="cliente.nombre_contacto" name="nombre_contacto" id="nombre_contacto" class="form-control">
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-md-6">
                <div class="form-group" v-bind:class="errors.nit">
                  <label>NIT</label>
                  <input type="text" v-model="cliente.nit" name="nit" id="nit" class="form-control" required="required">
                </div>
                <!-- /.form-group -->
                <div class="form-group" v-bind:class="errors.email">
                  <label>Correo</label>
                  <input type="email" v-model="cliente.email" name="email" id="email" class="form-control">
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-md-6 col-md-offset-3">
                <div class="form-group" v-bind:class="errors.telefono">
                  <label>Teléfono</label>
                  <input type="text" v-model="cliente.telefono" name="telefono" id="telefono" class="form-control">
                </div>
                <!-- /.form-group -->
              </div>
            </form>
            <!-- /.row -->
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-primary" v-on:click="editCliente(cliente)">Guardar</button>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
  </div>
</template>
<script>

  module.exports =  {
    data () {
      return {
        clientes:[],
        cliente:{},
        message :'',
        option_toast:{
          timeOut: 5000,
          "positionClass": "toast-top-center",
          "closeButton": true,
        },
        errors:{
          'nombre':'',
          'nit':'',
          'nombre_contacto':'',
          'telefono':'',
          'email':'',
        }
      }
    },created:function () {
      this.listarClientes();
    },
    methods:{
      setErrors:function(object) {
        this.message='';
        var that = this;
        $.each(object, function(index, value) {
          that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
          that.errors[index] = 'has-warning';
        });
      },
      openModal: function(client) {
        $('.editarModal').modal('show');
        this.cliente = client;

      },
      listarClientes: function(){
         this.$http.get('api/v1/clientes')
         .then(function(respuesta){
           this.clientes=respuesta.body;
           console.log(this.clientes);
         });
      },
      addCliente: function(e) {
        console.log(this.cliente);
        this.$http.post('api/v1/clientes', this.cliente)
        .then(function(respuesta){
          /*var that = this;
          that.message ='';*/
          if (respuesta.status != '200') {
            if (Object.keys(respuesta.body.obj).length>0) {
              this.setErrors(respuesta.body.obj);
              /*$.each(respuesta.body.obj, function(index, value) {
                that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
                that.errors[index] = 'has-warning';
              });*/
            }
            toastr.warning(that.message,respuesta.body.msg,this.option_toast);
          } else {
            toastr.success(respuesta.body.msg,'',this.option_toast);
            $('#agregar_cliente').trigger("reset");
            $('.collapse-cliente').collapse('hide');
            this.clientes.push(respuesta.body.obj);
          }
        }, (response) => {
          var that = this;
          that.message = '';
          if (Object.keys(response.body.obj).length>0) {
            this.setErrors(response.body.obj);
            /*$.each(response.body.obj, function(index, value) {
              that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
              that.errors[index] = 'has-error';
            });*/
          }
          toastr.error(that.message,response.body.msg,this.option_toast);
        });
      },
      editCliente: function(client) {
        this.$http.put('api/v1/clientes/'+client.id, client)
        .then(function(response) {
          var that = this;
          if (response.status != '200') {
            if (Object.keys(response.body.obj).length>0) {
              this.setErrors(response.body.obj);
              /*$.each(response.body.obj, function(index, value) {
                that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
                that.errors[index] = 'has-warning';
              });*/
            }
            toastr.warning(that.message,response.body.msg,this.option_toast);
          } else {
            $('.editarModal').modal('hide');
            toastr.success(response.body.msg,'',this.option_toast);
          }
        }, function(err) {
          var that = this;
          that.message = '';
          if (Object.keys(err.body.obj).length>0) {
            this.setErrors(err.body.obj);
            /*$.each(err.body.obj, function(index, value) {
              that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
              that.errors[index] = 'has-error';
            });*/
          }
          toastr.error(that.message,err.body.msg,this.option_toast);
        })
      },
      borrarCliente: function(client,index) {
        var that = this;
        this.$http.delete('api/v1/clientes/'+client.id)
        .then(function(response) {
          if (response.status != '200') {
            if (Object.keys(response.body.obj).length>0) {
              this.setErrors(response.body.obj);
              /*$.each(response.body.obj, function(index, value) {
                that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
                that.errors[index] = 'has-warning';
              });*/
            }
            toastr.warning(that.message,response.body.msg,this.option_toast);
          } else {
            toastr.success(response.body.msg,'',this.option_toast);
            this.clientes.splice(index,1);
          }
        },function(err) {
          if (Object.keys(err.body.obj).length>0) {
            this.setErrors(err.body.obj);
          }
          toastr.error(that.message,err.body.msg,this.option_toast);
        })
      }
  }
}
</script>