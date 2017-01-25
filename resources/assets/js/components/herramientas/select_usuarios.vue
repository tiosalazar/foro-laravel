<template>

  <multiselect
  :options="usuarios"
  :custom-label="nameWithLang"
  :searchable="false" placeholder="Seleccione un Usuario" label="nombre" track-by="nombre"
  :options-limit="300"
  :option-height="104">
  </multiselect>
</template>

<script>

  import Multiselect from 'vue-multiselect'

    module.exports= {
       components: { Multiselect},
         props: ['area'],
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
               var URL=$('#url_path').val();
              $.getJSON( URL+"/api/v1/usuarios/"+this.area, function(usuarios) {
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
