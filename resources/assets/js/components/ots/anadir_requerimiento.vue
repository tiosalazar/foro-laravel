<template>
  <div class="col-md-12">
              <div class="row">
                      <div class="col-md-4">
                        <h2>Requerimiento</h2>
                        </div>
                        <div class="col-md-8">
                        <div class="form-group col-md-6">
                          <label for="horas_area" class="col-sm-6 "><h5>Horas Area {{ area }}</h5> </label>
                          <div class="col-sm-6">
                                <input type="text" class="form-control" :id="'horas_area'+id_area" v-model="hTarea" :placeholder="'Numero de Horas '+area">
                          </div>
                      </div>
                       <div class="form-group col-md-6">
                          <label for="horas_area" class="col-sm-6 "><h5>Resumen {{ area }}</h5> </label>
                          <div class="col-sm-6">
                                <input type="text" class="form-control" disabled="disabled" v-model="v_resta" :placeholder="'Resumen de Horas '+area">
                          </div>
                      </div>
                    </div>
                  </div>
    <div class="row">
      <section class="Form__section" v-for="(ed,index) in requerimiento">
              <div class="form-group col-md-8">
                <label class="sr-only" for="nombre_requerimiento">Nombre Requerimiento</label>
                <input type="text" :name="requerimiento[index].nombre_requerimiento" class="form-control" id="nombre_requerimiento" placeholder="Nombre Requerimiento">
              </div>
              <div class="form-group  col-md-2">
                <label class="sr-only" for="no_horas_req">N° Horas</label>
                <input type="text" :name="requerimiento[index].no_horas_req" class="form-control" id="no_horas_req" placeholder="No. Horas">
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

     module.exports={
       		props: ['htotales','area','id_area'],
      data () {
          return {
          hdisponibles:'',
          requerimiento: [
              {nombre_requerimiento: 'requerimiento[0][nombre_requerimiento]', no_horas_req: 'requerimiento[0][no_horas_req]'}
          ],
          nhoras:'',
          hTarea:''
        }
      },
      computed:{
        
        v_resta:function(){
          var resta;
          resta = this.hTarea;
          return resta
        }


      },
      methods: {
          addRequerimiento: function(e) {
              e.preventDefault();
              console.log(this.requerimiento);
              this.requerimiento.push(Vue.util.extend({}, this.requerimiento));
          },
          deleteRequerimiento: function(e) {
              e.preventDefault();
              var index = this.requerimiento.indexOf(Vue.util.extend({}, this.requerimiento));
                this.requerimiento.splice(index, 1);

          }
     }
   }
</script>
