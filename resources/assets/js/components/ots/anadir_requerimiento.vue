<template>
  <div class="col-md-12">
              <div class="row">
                      <div class="col-md-4">
                        <h2>Requerimiento</h2>
                        </div>
                        <div class="col-md-8">
                        <div class="form-group col-md-6" v-bind:class="{ 'has-error': errors.has('horas_area'+id_area) }">
                          <label for="horas_area" class="col-sm-6 "><h5>Horas Area {{ area }}</h5> </label>
                          <div class="col-sm-6">
                                <input type="text" :name="'horas_area'+id_area"  v-validate data-vv-rules="required|numeric " data-vv-as="Horas Area" class="form-control" :id="'horas_area'+id_area" v-model="nhoras" :placeholder="'Numero de Horas '+area">
                                  <span  class="help-block" v-show="errors.has('horas_area'+id_area)">{{ errors.first('horas_area'+id_area) }}</span>
                          </div>
                      </div>
                       <div class="form-group col-md-6"  v-bind:class="{ 'has-error': h_pasadas }">
                          <label for="horas_area" class="col-sm-6 "><h5>Resumen {{ area }}</h5> </label>
                          <div class="col-sm-6">
                                <input type="text" class="form-control" disabled="disabled" v-model="v_resta" :placeholder="'Resumen de Horas '+area">
                                <span  class="help-block" v-show="h_pasadas">Se ha pasado del numero de horas permitidas para el Area</span>

                          </div>
                      </div>
                    </div>
                  </div>
    <div class="row">
      <section class="Form__section" v-for="(ed,index) in requerimiento">
              <div class="form-group col-md-8" v-bind:class="{ 'has-error': errors.has('nombre_requerimiento'+index) }">
                <label class="sr-only" for="nombre_requerimiento">Nombre Requerimiento</label>
                <input type="text" :name="'nombre_requerimiento'+index" v-validate data-vv-rules="required|min:4" data-vv-as="Nombre Requerimiento" v-model="requerimiento[index].model_nom" class="form-control" :id="'nombre_requerimiento'+index" placeholder="Nombre Requerimiento">
                 <span  class="help-block" v-show="errors.has('nombre_requerimiento'+index)">{{ errors.first('nombre_requerimiento'+index) }}</span>
              </div>
              <div class="form-group  col-md-2"  v-bind:class="{ 'has-error': errors.has('no_horas_req'+index) }">
                <label class="sr-only" for="no_horas_req">N° Horas</label>
                <input type="text" @input="realizarCalculo" :name="'no_horas_req'+index" v-validate data-vv-rules="required|numeric" data-vv-as="Nombre Requerimiento"  v-model="requerimiento[index].model_horas" class="form-control" :id="'no_horas_req'+index" placeholder="No. Horas">
                <span  class="help-block" v-show="errors.has('no_horas_req'+index)">{{ errors.first('no_horas_req'+index) }}</span>
             </div>
             <div class="form-group  col-md-2">
               <button type="button" @click="deleteRequerimiento" class="btn btn-danger">Eliminar</button>
            </div>
      </section>
    </div>
    <div class="row">
      <div class="col-md-3">
        <button type="button" @click="addRequerimiento" class="btn btn-block btn-success col-sm-3">Añadir Tarea</button>
      </div>
    </div>
  </div>
</template>

<script>
 import VeeValidate, { Validator } from 'vee-validate';
 //Traducciones del validador
import messages from '../../es/es';

//Realizando los Use
// Merge the locales.
Validator.updateDictionary({es: { messages }});
// Install the plugin and set the locale.
Vue.use(VeeValidate, { locale: 'es' });

/*
DSO Crea una validación personalizada
Validator.extend('verify_password', {
    getMessage: field => `The password must contain at least: 1 uppercase letter, 1 lowercase letter, 1 number, and one special character (E.g. , . _ & ? etc)`,
    validate: value => {
        var strongRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
        return strongRegex.test(value);
    }
});

// with either of the two lines I get the same error.
// const validator = new Validator();
let validator = new Validator();

validator.attach('password', 'required|min:8|verify_password');*/

     module.exports={
       components: {VeeValidate,Validator},
       		props: ['htotales','area','id_area','realizar_validado'],
      data () {
          return {
          hdisponibles:'',
          requerimiento: [
              {  model_nom:'', model_horas:0}
          ],
          nhoras:'',
          hTarea:'',
          v_resta:'',
          h_pasadas:false,
          value:{}
        }
      },
      computed:{
        realizar_validado2: function(){
             
             if ( this.realizar_validado) {
              this.$validator.validateAll();
              if (!this.errors.any()) {
             console.$log("hola 222");
               }
             } 
           console.$log("hola");
        }
         
      },
      watch: {
        nhoras: function (val) {
          this.realizarCalculo();
          }

      },
      created: function(){
        this.$on('validar_requerimiento', function(b) {
            console.$log(b);
          });   
      },
      methods: {
          vueSet (obj, path, val) {
               let value = obj
               console.log(val);
               let fields = _.isArray(path) ? path : _.toPath(path)
               for (let f in fields) {
                 let idx = Number(f)
                 let p = fields[idx]
                 if (idx === fields.length - 1) Vue.set(value, p, val)
                 else if (!value[p]) Vue.set(value, p, _.isNumber(p) ? [] : {})
                 value = value[p]
               }
          },
          addRequerimiento: function(e) {
              e.preventDefault();
              this.$validator.validateAll();
              if (!this.errors.any()) {
              this.requerimiento.push(Vue.util.extend({}, this.requerimiento));
               }
          },
          deleteRequerimiento: function(e) {
              e.preventDefault();
              var index = this.requerimiento.indexOf(Vue.util.extend({}, this.requerimiento));
              this.requerimiento.splice(index, 1);
              //Realizar el Calculo de las horas.
              this.realizarCalculo();


          },
        realizarCalculo: function () {
          var resta;
          var sumatoria=0;
          for (let f in this.requerimiento) {
              let idx = Number(f)
              let p = this.requerimiento[idx]
              if (idx === this.requerimiento.length - 1){
                 if(p.model_horas){
                   sumatoria += parseInt(p.model_horas)
                 }
              }
              if ( idx != this.requerimiento.length - 1) {
                if(p["model_horas"]){
                  sumatoria += parseInt(p["model_horas"])
                }
            }
          }
          if (this.nhoras < sumatoria) {
            this.h_pasadas=true;
          }else {
              this.h_pasadas=false;
          }
           this.v_resta= this.nhoras-sumatoria;
        }


     }/*,
      created () {
     _.forEach(this.requerimiento, (form) => {
           Object.defineProperty(this.requerimiento, form.model, {
             get: () => _.get(this.value, form.model),
             set: (v) => this.vueSet(this.value, form.model, v)
           })
         })
       }*/
   }
</script>
