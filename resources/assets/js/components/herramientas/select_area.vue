<template>
  <div>
  <div >
      <multiselect
      :options="areas"
      :searchable="true" placeholder="Seleccione un Área" label="nombre" track-by="nombre"
      :options-limit="100"
      :allow-empty="false"
      :value="value"
      @input="updateSelected"
      :option-height="104">
      </multiselect>
      <input type="hidden"  :value="id_area" name="area_id">
    </div>
      <div style="height:12px"></div>
  </div>
</template>

<script>

  import Multiselect from 'vue-multiselect'
    module.exports= {
       components: { Multiselect},
         // props: ['area'],
      data () {
          return {
            areas:[],
            id_area: 0,
            area:{},
            isTouched: false
          }
      },
      computed:{
        value: function (val) {
          
          return this.area;
        },
      },
      created: function(){
          this.fetchTips();
      },
      methods:{
          fetchTips: function(){
               this.$http.get('api/v1/areas/')
             .then(function(respuesta){
                     this.areas=respuesta.body;
             }.bind(this));
          },
         updateSelected (newSelected) {
            if (newSelected != null && newSelected != undefined) {
             this.id_area = newSelected.id;
             console.log(newSelected.id)
           }else {
             this.id_area = 0;
           }
        },
    }
  }
</script>
