<template>
  <div>
  <div :class="{ 'select-error': isInvalid }">
      <multiselect
      :options="roles"
      select-label=""
      :close-on-select="true"
      selected-label=""
      deselect-label=""
      :searchable="true" placeholder="Seleccione un Rol" select-label="" label="display_name" track-by="display_name"
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
      <span  class="help-block">El campo Rol es obligatorio</span>
    </div>
      <div style="height:12px"></div>
  </div>
</template>

<script>

  import Multiselect from 'vue-multiselect'


 
    module.exports= {
       components: { Multiselect},
       props: ['refresh'],
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
          console.log(this.isTouched, this.value_touch);
          return (this.isTouched &&  this.value_touch=="" )?true:false //Compruebo de que haya selecionado algo

        }
      },
      created: function(){
          this.fetchTips();
        // console.log(this.refresh);
        this.value={id: this.refresh.id, display_name: this.refresh.id_rol};
        this.id_rol=this.refresh.id;
        // console.log(this.refresh);
       
      },
      watch : {
        refresh : function (value) {
           this.value=0;
        }
      },
      methods:{
          fetchTips: function(){
               this.$http.get('/api/v1/roles/')
             .then(function(respuesta){
                 this.roles=respuesta.body;
             }.bind(this));
          },

         updateSelected (newSelected) {
            if (newSelected != null && newSelected != undefined) {
             this.id_rol = newSelected.id;
             this.value_touch=newSelected;
             this.$parent.$emit('rol_option',newSelected);
             console.log(newSelected);

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
