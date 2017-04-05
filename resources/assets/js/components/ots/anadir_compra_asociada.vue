<!--Componente el cual se encarga de guardar las compras asociadas a la OT  -->
<!-- area: String -> Nombre del area -->
<!-- id_area: Number ->  El id del area, esta sirve para saber en que arreglo buscar al momento de guardar -->
<!-- Autor: David Salazar  -->
<!-- Fecha : Enero 2017  -->
<template>
  <div  id="seccion_compra"class="col-md-12">
    <div class="row">
      <section class="form_section" v-for="(ed,index) in compra_asociada">
       <div class="row">
         <div :class="{'col-md-4': campos_extra =='1'}" class="col-md-6">
          <div class="form-group col-xs-12">
            <label class="sr-only" for="nombre_requerimiento">Item</label>
            <select_tipo_compra  :index="index" :select="ed.tipo_compra"></select_tipo_compra>
          </div>
        </div>
        <div v-show="campos_extra =='1' ">
          <div class="col-md-5">
           <div class="form-group  col-xs-12">
             <label class="sr-only" for="nombre_requerimiento"><sup>*</sup> Estado</label>
             <select_estados tipo_estado="5" :index="index" :select="ed.estado" ></select_estados>
           </div>
         </div>
         <div class="col-md-3">
 					<div class="form-group">
 						<label class="sr-only" for="transaccion"><sup>*</sup> No Transacción</label>
 						<input type="text" name="transaccion" id="transaccion"  class="form-control" placeholder="No. Transacción">
 					</div>
 				</div>

        </div>
      </div>
      <div class="form-group  col-md-12 col-xs-12" v-bind:class="{ 'has-error': errors.has('descipcion_compra'+index) }">
        <label class="sr-only" for="descipcion_compra">Descripción</label>
        <textarea  :name="'descipcion_compra'+index" rows="3" @input="guardarDatos" v-validate data-vv-rules="required|min:4" data-vv-as="Descripción" v-model="ed.model_desc" class="form-control"   placeholder="Descripción">
        </textarea>
        <span  class="help-block" v-show="errors.has('descipcion_compra'+index)">{{ errors.first('descipcion_compra'+index) }}</span>
      </div>
      <div class="row">
       <div class="col-md-12">
        <div class="form-group  col-md-4 col-xs-12"  v-bind:class="{ 'has-error': errors.has('provedor_compra'+index) }">
          <label class="sr-only" for="no_horas_req">Provedor</label>
          <input type="text"  :name="'provedor_compra'+index"  @input="guardarDatos" v-validate data-vv-rules="required|min:4" data-vv-as="Provedor" v-model="ed.model_provedor" class="form-control" :id="'provedor_compra'+index"   placeholder="Provedor">
          <span  class="help-block" v-show="errors.has('provedor_compra'+index)">{{ errors.first('provedor_compra'+index) }}</span>
        </div>
        <div class="form-group  col-md-4 col-xs-12"  v-bind:class="{ 'has-error': errors.has('valor_compra'+index) }">
          <label class="sr-only" for="no_horas_req">Valor</label>
          <input type="text" :name="'valor_compra'+index"  @input="guardarDatos(),processValue(index)" v-validate data-vv-rules="required" data-vv-as="Valor" v-model="ed.model_valor" class="form-control" :id="'valor_compra'+index"  placeholder="Valor">
          <span  class="help-block" v-show="errors.has('valor_compra'+index)">{{ errors.first('valor_compra'+index) }}</span>
        </div>
        <div class="form-group col-md-4  col-xs-12"><select_divisa :index="index" :select="ed.divisa"></select_divisa> </div>
      </div>
    </div>
    <div class="col-md-12">
      <div style="height:22px"></div>
      <div class="separador"> </div>
      <div style="height:22px"></div>
    </div>
  </section>
</div>

<div class="row">
  <div class="col-md-12 text-center">
    <div class="col-md-5 col-md-offset-1">
      <button type="button" @click="addRequerimiento" :class="{'disabled' : disabled }" class="btn btn-block boton_foro btn-success succes col-sm-3" :disabled="disabled">Añadir Compra</button>
    </div>
    <div class="form-group  col-md-5 col-xs-12" v-show="$parent.visualizacion != 'true'">
      <button type="button" style="width:100%" @click="deleteRequerimiento" :class="{'disabled' : disabled }" class="btn btn-danger boton_foro error " :disabled="disabled">Eliminar</button>
    </div>
  </div>
</div>

</div>
</template>

<script>

  module.exports={
    props: ['area','id_area','realizar_validado','limpiar_datos','campos_extra'],
    data () {
      return {
        compra_asociada: [
        { tipo_compra:{id:'',nombre:'' }, model_desc:'', model_provedor:'',model_valor:'', divisa:{id:'',nombre:''}, estado:{id:'', nombre:''}}
      ],
      option_toast:{
        timeOut: 5000,
        "positionClass": "toast-top-center",
        "closeButton": true,
      }
      }
    },
    watch: {
      realizar_validado:function(){
        if (this.realizar_validado==true) {
          this.$validator.validateAll();
          if (!this.errors.any()) {
            this.$parent.$emit('form_compras_validado',true);
          }else{
            this.$parent.$emit('form_compras_validado',false);
          }
        }
      },
      limpiar_datos: function(){
        if(this.limpiar_datos == true){
          this.compra_asociada=[
          { tipo_compra:{id:'',nombre:'' }, model_desc:'', model_provedor:'',model_valor:'', divisa:{id:'',nombre:''}, estado:{id:'',nombre:''}}
          ];
        }
      },
    },
    computed:{
      disabled: function(){
        return this.$parent.diabled_compras;
      }
    },
    created: function(){
      this.llenarDatosSiesVisualizacion();
      this.llenarCampos();
    /*
     Escucha la opción seleccionada del selector tipo Compra
     */
     this.$on('tipo_compra', function(v) {
      if( v != "" ){
        this.compra_asociada[v.index].tipo_compra=v.tipo_compra;
      }
    });
    /*
     Escucha la opción seleccionada del selector de divisa
     */
     this.$on('divisa', function(v) {
      if( v != ""){
        this.compra_asociada[v.index].divisa=v.divisa;
      }
    });
    this.$on('select_estado', function(v) {
      console.log(v);
      if( v != ""){
        this.compra_asociada[v.index].estado=v.estado;
      }
    });
   },
   methods: {
    /*
    Al darle click en añadir Requerimiento la función valida la información y añade una nueva posición al
    arreglo de requerimientos
    */
    processValue:function(index) {
      this.compra_asociada[index].model_valor =  numeral(this.compra_asociada[index].model_valor).format('0,0')
    },
    /*
     arregla al arreglo de requerimientos una nueva posición con los datos en blanco
    */
    addRequerimiento: function(e) {
      e.preventDefault();
      this.$validator.validateAll();
      if (!this.errors.any() && this.comprobarDatos()==true ) {
        this.compra_asociada.push(Vue.util.extend({}, this.compra_asociada));
      }
    },
    /*
      Función la cual comprueba los datos
    */
    comprobarDatos:function(){
      var arreglo_compras=this.compra_asociada;
      for (let f in arreglo_compras) {
       let idx = Number(f)
      if (  this.compra_asociada[idx].divisa.nombre=="") {
        toastr.error('No ha seleccionado ninguna divisa','Error en los Datos',this.option_toast);
        return false;
      }else if ( this.campos_extra=="1" && this.compra_asociada[idx].estado.nombre=="") {
        toastr.error('No ha seleccionado ningún estado','Error en los Datos',this.option_toast);
        return false;
      }else if (  this.compra_asociada[idx].tipo_compra.nombre=="") {
        toastr.error('No ha seleccionado ningún tipo de compra','Error en los Datos',this.option_toast);
        return false;
      }else{
        return true;
      }


    }

    },
    /*
      Función la cual se llama si esta en la vista de editar, esta función organiza los datos de la BD a la vista.
    */
    llenarDatosSiesVisualizacion: function(){
      if (this.$parent.visualizacion=="true") {
       var arreglo_visualizar =JSON.parse(this.$parent.arreglo_visualizar);
       var arreglo_compras=arreglo_visualizar.final_com;
          //console.log(arreglo_compras);
              for (let f in arreglo_compras) {
               let idx = Number(f)
               var datos=[{compras:[] }];
               if(arreglo_compras[idx].compras != undefined && arreglo_compras[idx].compras != null && arreglo_compras[idx].area == this.id_area ){
                 datos=[{compras:arreglo_compras[idx].compras }];
                   this.$localStorage.set('datos_compra_'+arreglo_compras[idx].area,JSON.stringify(datos));//busca dependiendo del Área
                   this.disabled=false;
                 }/*else{
                   this.compra_asociada=[];

                 }*/
               }
          }
      },
    /*
     Si encuentra el arreglo guardado en el localStorage llena nos datos con lo que se ha escrito.
     */
     llenarCampos:function () {
      var data_req= JSON.parse(this.$localStorage.get('datos_compra_'+this.id_area));
      if (data_req != null ) {
        var arreglo_requerimientos = data_req[0].compras;
        this.compra_asociada= arreglo_requerimientos;
      }

    },
    /*
     Función la cual se encarga de borrar un requerimiento, lo que hace es que
     busca el indece el cual se toco y se procede a eliminar del arreglo de
     requerimientos
     */
     deleteRequerimiento: function(e) {
      e.preventDefault();
      var index = this.compra_asociada.indexOf(Vue.util.extend({}, this.compra_asociada));
      this.compra_asociada.splice(index, 1);
    },
    /*
     Guarda los datos con cada entrada del Tecla en el input
     */
     guardarDatos: function(){
      var datos=[{compras:this.compra_asociada,id_area:this.id_area}];
      this.$parent.$emit('datos_compras',datos); //Emite los datos al padre
    },
  }
}
/*Componentes que voy a utilizar */
Vue.component('select_tipo_compra',require('../herramientas/select_tipo_compra.vue'));
Vue.component('select_divisa',require('../herramientas/select_divisas.vue'));
</script>
