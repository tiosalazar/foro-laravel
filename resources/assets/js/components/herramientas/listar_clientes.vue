<template >
 <table class="table table-hover ">
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


    export default {
      data () {
          return {
            clientes:[]
          }
      },created: function(){
          this.fetchTips();
      },
      methods:{
          fetchTips: function(){
           var URL='http://localhost/foro-laravel/public';
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