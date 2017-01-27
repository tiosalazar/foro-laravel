<template>
  <div>
  <div >
      <multiselect
      :options="roles"
      :searchable="true" placeholder="Seleccione un Rol" label="nombre" track-by="nombre"
      :options-limit="100"
      :allow-empty="false"
      @input="updateSelected"
      :option-height="104">
      </multiselect>
      <input type="hidden"  :value="id_rol" name="id_rol">
    </div>
      <div style="height:12px"></div>
  </div>
</template>

<script>

  import Multiselect from 'vue-multiselect'
    module.exports= {
       components: { Multiselect},
      data () {
          return {
            roles:[],
            id_rol: 0,
            isTouched: false
          }
      },
      computed:{},
      created: function(){
          this.fetchTips();
      },
      methods:{
          fetchTips: function(){
               this.$http.get('api/v1/roles/')
             .then(function(respuesta){
                     this.roles=respuesta.body;
             }.bind(this));
          },
         updateSelected (newSelected) {
            if (newSelected != null && newSelected != undefined) {
             this.id_rol = newSelected.id;
           }else {
             this.id_rol = 0;
           }
        },
    }
  }
</script>
