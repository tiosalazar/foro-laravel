<template >
 <table class="table table-hover " id="app-datatable">
  <tbody><tr>
    <th>NIT</th>
    <th>Cliente</th>
    <th>Nombre de Contacto</th>
    <th>Correo</th>
    <th>Teléfono</th>
    <th></th>
    <th></th>
  </tr>
  <tr v-for="cliente in clientes" href="#" class="list-group-item clearfix">
     {{ cliente }}
  </tr>
</tbody></table>
</template>
<script>


    module.exports =  {
      data () {
          return {
            clientes:[]
          }
      }/*,created: function(){
          this.fetchTips();
      },*/
      ,created(){
            this.$nextTick(function() {
              $('#app-datatable').DataTable();
            })
          },
      methods:{
          fetchTips: function(){
           var URL='http://localhost:3000';
              $.getJSON(URL+"/api/v1/clientes", function(clientes) {
                  //this.$set('clientes', clientes);
                  this.clientes=clientes;
                  console.log(this.clientes)
              }.bind(this));
          },
        nameWithLang ({ nombre, nombre_contacto }) {
          return `${nombre} — ${nombre_contacto}`
        },
         updateSelected (newSelected) {
            this.selected = newSelected
            console.log(this.selected);
          }
    }
  }
</script>