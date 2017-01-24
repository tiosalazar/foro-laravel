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
  <a v-for="cliente in clientes" href="#" class="list-group-item clearfix">
     {{ cliente }}
  </a>
</tbody></table>
</template>
<script>


    export default {
      data () {
          return {
            clientes:[
              'Vue.js: The Basics',
                'Vue.js Components',
                'Server Side Rendering with Vue',
                'Vue + Firebase'
              ]
          }
      }
  }
</script>