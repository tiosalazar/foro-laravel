<template>

  <multiselect  :options="usuarios" :custom-label="nameWithLang"  :searchable="false" placeholder="Seleccione un Usuario" label="nombre" track-by="nombre" :options-limit="300" :option-height="104">
  </multiselect>
</template>

<script>

  import Multiselect from 'vue-multiselect'

    export default {
       components: { Multiselect},
      data () {
          return {
            usuarios:[]
          }
      },
      created: function(){
          this.fetchTips();
      },
      methods:{
          fetchTips: function(){
              $.getJSON("http://127.0.0.1:8000/api/v1/usuarios/1", function(usuarios) {
                  //this.$set('clientes', clientes);
                  this.usuarios=usuarios;
              }.bind(this));
          },
        nameWithLang ({ nombre, apellido }) {
          return `${nombre} — ${apellido}`
        }
    }
  }
</script>
