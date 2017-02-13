<template>
  <div>
  <div :class="{ 'select-error': isInvalid }" class="areas">
      <multiselect
      :options="areas"
      selected-label=""
      deselect-label=""
      :close-on-select="true"
      select-label=""
      :searchable="true" placeholder="Seleccione un Área" label="nombre" track-by="nombre"
      :options-limit="100"
      :allow-empty="false"
      :value="value2"
      @input="updateSelected"
      @close="onTouch"
      :option-height="104">
      </multiselect>
      <input type="hidden"  :value="id_area" name="area_id">
    </div>
    <div style="padding:2px 0px;"  :class="{ 'has-error': isInvalid }" v-show="isInvalid">
      <span  class="help-block">El campo Área es obligatorio</span>
    </div>
      <div style="height:12px"></div>
  </div>
</template>

<script>

  import Multiselect from 'vue-multiselect'
    module.exports= {
       components: { Multiselect},
          props: ['refresha'],
      data () {
          return {
            areas:[],
            id_area: 0,
            area:{},
            isTouched: false,
            value:'',
            value2:{}
          }
      },
      computed:{
        /*value: function (val) {
          
          return this.area;
        },*/
        isInvalid () {
          return (this.isTouched &&  this.value=="" )?true:false //Compruebo de que haya selecionado algo
        }
      },
      created: function(){
        this.fetchTips();
        this.value2={id: this.refresha.id, nombre: this.refresha.id_area};
        this.id_rol=this.refresha.id;
      },
      watch : {
        refresha : function (value) {
           this.value2=0;
        }
      },
      methods:{
          fetchTips: function(){
               this.$http.get('/api/v1/areas/')
             .then(function(respuesta){
                     this.areas=respuesta.body;
             }.bind(this));
          },
         updateSelected (newSelected) {
            if (newSelected != null && newSelected != undefined) {

             this.id_area = newSelected.id;
              this.value = newSelected;
              this.$parent.$emit('area_option',newSelected);
           }else {
             this.id_area = 0;
           }
        },
        /*
        * esta función se ejecuta cuando se da click fuera del cuadro de Dialogo
        */
        onTouch () {
          this.isTouched =(this.value=="" )?true:false ; //Compruebo de que haya selecionado algo
        },
    }
  }
</script>
