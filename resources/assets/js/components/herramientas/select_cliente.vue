<template>
  <div>
  <div :class="{ 'select-error': isInvalid }">
      <multiselect
      :options="roles"
      select-label=""
      :close-on-select="true"
      selected-label=""
      deselect-label=""
      :searchable="true" placeholder="Seleccione un cliente" select-label="" label="display_name" track-by="display_name"
      :options-limit="100"
      :allow-empty="false"
      @input="updateSelected"
      @close="onTouch"
      :value="value"
      :option-height="104">
      </multiselect>
      <input type="hidden"  :value="id_rol" name="id_rol" >
    </div>
     <div style="padding:2px 0px;"  :class="{ 'has-error': isInvalid }" v-show="isInvalid">
      <span  class="help-block">El campo cliente es obligatorio</span>
    </div>
      <div style="height:12px"></div>
  </div>
</template>

<script>

  import Multiselect from 'vue-multiselect'



  module.exports= {
   components: { Multiselect},
   props: ['refresh','permisosid'],
   data () {
    return {
      roles:[],
      id_rol: 0,
      isTouched: false,
      value_touch:'',
      value:{}
    }
  },
  computed: {
    isInvalid () {
          return (this.isTouched &&  this.value_touch=="" )?true:false //Compruebo de que haya selecionado algo
        }
      },
      created: function(){
        this.fetchTips();
        this.value={id: this.refresh.id, display_name: this.refresh.id_rol};
        this.id_rol=this.refresh.id;
      },
      watch : {
        refresh : function (value) {
         this.value=value;
       },
       permisosid : function (value) {
         this.value=value;
       }
     },
     methods:{
      fetchTips: function(){
       this.$http.get(window._apiURL+'clientes_requerimiento')
       .then(function(respuesta){
        console.log(respuesta);
         this.roles=respuesta.body;
       });
     },

     updateSelected (newSelected) {
      if (newSelected != null && newSelected != undefined) {
       this.id_rol = newSelected.id;
       this.value_touch=newSelected;
       this.$parent.$emit('cliente_option',newSelected);
     }else {
       this.id_rol = 0;
     }
   },
   /*
   * esta función se ejecuta cuando se da click fuera del cuadro de Dialogo
   */
    onTouch () {
      this.isTouched =(this.value_touch=="" )?true:false ; //Compruebo de que haya selecionado algo
    }
  }
}
</script>
