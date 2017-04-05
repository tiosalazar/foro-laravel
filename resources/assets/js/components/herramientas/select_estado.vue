  <!--Componente para Seleccionar Estados  -->
  <!-- Autor: David Salazar  -->
  <!-- Fecha : Enero 2017  -->
  <template>
    <div>
      <div :class="{ 'select-error': isInvalid }" class="estados">
        <multiselect
        :options="estados"
        selected-label=""
        deselect-label=""
        :searchable="false" placeholder="Seleccione un Estado" select-label="" label="nombre" track-by="nombre"
        :close-on-select="true"
        :allow-empty="false"
        :value="value"
        :options-limit="300"
        @input="updateSelected"
        @remove="removeSelected"
        @close="onTouch"
        :option-height="104">
      </multiselect>
      <!--Se deja un Hidden por si se va a implementar en un form no tener que hacer emits -->
      <input type="hidden"  :value="id_estado" name="id_estado">
    </div>
    <div style="padding:2px 0px;"  :class="{ 'has-error': isInvalid }" v-show="isInvalid">
      <span  class="help-block">El campo Estado es obligatorio</span>
    </div>
    <!-- <div style="height:12px"></div> -->
  </div>
  </template>

  <script>
    /*Se Realiza el import de multiselect*/
    import Multiselect from 'vue-multiselect'

    module.exports= {
      components: {Multiselect},
    props: ['tipo_estado','select','cambiar_estado','index'], //en la propiedad select se va a meter la opción por defecto
    data () {
      return {
        estados:[],
        id_estado:0,
        isTouched: false,
        // value:0,
        option_toast:{
          timeOut: 5000,
          "positionClass": "toast-top-center",
          "closeButton": true,
        }
      }

    },
    computed:{
      isInvalid () {
        console.log(this.isTouched, this.value)
        let algo = (this.isTouched &&  this.value=="" )?true:false//Compruebo de que haya selecionado algo
        console.log(algo)
        return algo
      },
      value: function () {
        return this.select;
      },
    },
    watch: {
      select:function(val) {
        this.isInvalid = false;
        this.isTouched=false;
      },
    },
    created: function(){

      this.fetchTips();
      //Valido que la propiedad encargado que traigo de la tarea tenga datos
      if (typeof this.select != 'undefined' || this.select != null) {
        if (this.cambiar_estado == '' && this.cambiar_estado == null ) {
         this.updateSelected(this.select);
       }
       this.id_estado=this.select.id;
     }

   },
   methods:{
    fetchTips: function(){
      this.$http.get(window._apiURL+'estados/'+this.tipo_estado)
      .then(function(respuesta){
        this.estados=respuesta.body;
      }.bind(this));
    },
      /*
      Cuando se selecione algo se realiza la siguiente función
      */
      updateSelected (newSelected) {
        if (newSelected != null && newSelected != undefined) {
          this.id_estado = newSelected.id;
          this.value=newSelected;
          console.log(newSelected);
          if(this.index != null ){
            var respuesta = {index: this.index, estado: newSelected }//Devuelvo el Index en el que se encuentra junto con el arreglo de datos, para saber en que posición
            this.$parent.$emit('select_estado',respuesta);
          }else{
              this.$parent.$emit('select_estado',newSelected);
          }

          if (this.cambiar_estado != '' && this.cambiar_estado != null ) {
            this.$http.put(window._apiURL+'actualizar_estado_ot/'+this.cambiar_estado, newSelected.id)
            .then(function(respuesta){
              if (respuesta.status != '200') {
                if (Object.keys(respuesta.obj).length>0) {
                  toastr.error("Ocurrio un error al cambiar el estado, consulte con soporte",respuesta.body.msg,this.option_toast);
                  return false;
                }
              }else{
                toastr.success(respuesta.body.msg,'',this.option_toast);
              }
              console.log(respuesta);
            }.bind(this));

          }
        }else {
          this.id_estado = 0;
          this.$parent.$emit('select_estado','');//emito la variable vasia para comprobar en el padre
        }
      },
      /*
        esta función se ejecuta cuando se remueve un tag
        */
        removeSelected () {
          this.id_estado = 0;
        this.$parent.$emit('select_estado','');//emito la variable vasia para comprobar en el padre
      },
      /*
        esta función se ejecuta cuando se da click fuera del cuadro de Dialogo
        */
        onTouch () {
          this.isTouched =(this.value=="" )?true:false ;
        }
      }
    }
  </script>
