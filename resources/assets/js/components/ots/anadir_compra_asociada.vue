<!--Componente el cual se encarga de guardar las compras asociadas a la OT  -->
<!-- area: String -> Nombre del area -->
<!-- id_area: Number ->  El id del area, esta sirve para saber en que arreglo buscar al momento de guardar -->
<!-- Autor: David Salazar  -->
<!-- Fecha : Enero 2017  -->
<template>
  <div class="col-md-12">
    <div class="row">
      <section class="form_section" v-for="(ed,index) in compra_asociada">
       <div class="row">
         <div class="col-md-6">
            <div class="form-group  col-xs-12">
            <label class="sr-only" for="nombre_requerimiento">Item</label>
            <select_tipo_compra  :index="index" :select="ed.tipo_compra"></select_tipo_compra>
          </div>
         </div>
       </div>
          <div class="form-group  col-md-12 col-xs-12" v-bind:class="{ 'has-error': errors.has('descipcion_compra'+index) }">
            <label class="sr-only" for="descipcion_compra">Descripción</label>
            <textarea  :name="'descipcion_compra'+index" rows="3" @mouseover="guardarDatos" v-validate data-vv-rules="required|min:4" data-vv-as="Descripción" v-model="ed.model_desc" class="form-control"   placeholder="Descripción">  
            </textarea>
            <span  class="help-block" v-show="errors.has('descipcion_compra'+index)">{{ errors.first('descipcion_compra'+index) }}</span>
          </div>
         <div class="row">
         <div class="col-md-12">
        <div style="display: inline-block;">
          <div class="form-group  col-md-4 col-xs-12"  v-bind:class="{ 'has-error': errors.has('provedor_compra'+index) }">
            <label class="sr-only" for="no_horas_req">Provedor</label>
            <input type="text"  :name="'provedor_compra'+index"  @mouseover="guardarDatos" v-validate data-vv-rules="required|min:4" data-vv-as="Provedor" v-model="ed.model_provedor" class="form-control" :id="'provedor_compra'+index"   placeholder="Provedor">
            <span  class="help-block" v-show="errors.has('provedor_compra'+index)">{{ errors.first('provedor_compra'+index) }}</span>
          </div>
          <div class="form-group  col-md-4 col-xs-12"  v-bind:class="{ 'has-error': errors.has('valor_compra'+index) }">
            <label class="sr-only" for="no_horas_req">Valor</label>
            <input type="text" :name="'valor_compra'+index"  @mouseover="guardarDatos" v-validate data-vv-rules="required|numeric" data-vv-as="Valor" v-model="ed.model_valor" class="form-control" :id="'valor_compra'+index"  placeholder="Valor">
            <span  class="help-block" v-show="errors.has('valor_compra'+index)">{{ errors.first('valor_compra'+index) }}</span>
          </div>
          <div class="form-group col-md-4 nopadding col-xs-12"><select_divisa :index="index" :select="ed.divisa"></select_divisa> </div> 
          </div>
        </div>
        </div> 
      </section>
    </div>

    <div class="row"  v-show="$parent.visualizacion != 'true'">
    <div class="form-group  col-md-1 col-xs-12" v-show="$parent.visualizacion != 'true'">
            <button type="button" @click="deleteRequerimiento" class="btn btn-danger">Eliminar</button>
      </div>
      <div class="col-md-3">
        <button type="button" @click="addRequerimiento" class="btn btn-block btn-success col-sm-3">Añadir Compra</button>
      </div>
    </div>

  </div>
</template>

<script>

module.exports={
  props: ['area','id_area','realizar_validado'],
  data () {
    return {
      compra_asociada: [
        { tipo_compra:{id:'',nombre:'' }, model_desc:'', model_provedor:'',model_valor:'', divisa:{id:'',nombre:''}}
      ]
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
        { tipo_compra:{id:'',nombre:'' }, model_desc:'', model_provedor:'',model_valor:'', divisa:{id:'',nombre:''}}
      ];
      }
    },
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
  },
  methods: {
    /*
    Al darle click en añadir Requerimiento la función valida la información y añade una nueva posición al
    arreglo de requerimientos
    */
    addRequerimiento: function(e) {
      e.preventDefault();
      this.$validator.validateAll();
      if (!this.errors.any()) {
        this.compra_asociada.push(Vue.util.extend({}, this.compra_asociada));
      }
    },
     llenarDatosSiesVisualizacion: function(){
        if (this.$parent.visualizacion=="true") {
               var arreglo_visualizar =JSON.parse(this.$parent.arreglo_visualizar);
                var arreglo_compras=arreglo_visualizar.final_com;
              // console.log(arreglo_compras);
               for (let f in arreglo_compras) {
                   let idx = Number(f)
               //   console.log(datos);
                //   var ingreso=[];
               //ingreso.push(arreglo_compras[idx].compras);
            var datos=[{compras:arreglo_compras[idx].compras }];
                  this.$localStorage.set('datos_compra_'+arreglo_compras[idx].area,JSON.stringify(datos));//busca dependiendo del Área

               }
              //  var datos=[{compras:arreglo_visualizar.compras}];
          //  this.$localStorage.set('datos_compra_'+arreglo_visualizar.requerimientos.area,JSON.stringify(datos));//busca dependiendo del Área
        }
      },
    /*
     Si encuentra el arreglo guardado en el localStorage llena nos datos con lo que se ha escrito.
    */
    llenarCampos:function () {
      var data_req= JSON.parse(this.$localStorage.get('datos_compra_'+this.id_area));
      if (data_req != null) {
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
      var datos=[{compras:this.compra_asociada}];
      this.$parent.$emit('datos_compras',datos); //Emite los datos al padre
    },
  }
}
/*Componentes que voy a utilizar */
Vue.component('select_tipo_compra',require('../herramientas/select_tipo_compra.vue'));
Vue.component('select_divisa',require('../herramientas/select_divisas.vue'));
</script>
