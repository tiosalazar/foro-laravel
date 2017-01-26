<template>
  <div class="col-md-12">
              <div class="row">
                      <div class="col-md-6">
                        <h2>Requerimiento</h2>
                        </div>
                        <div class="col-md-6">
                        <div class="form-group ">
                          <label for="horas_area" class="col-sm-4 "><h4>Horas Area</h4> </label>
                          <div class="col-sm-4">
                                <input type="text" class="form-control" id="horas_area"  placeholder="Numero de Horas Disponibles">
                          </div>
                      </div>
                    </div>
                  </div>
    <div class="row">
      <section class="Form__section" v-for="ed in requerimiento">
              <div class="form-group col-md-8">
                <label class="sr-only" for="nombre_requerimiento">Nombre Requerimiento</label>
                <input type="text" name="requerimiento[0][nombre_requerimiento]" class="form-control" id="nombre_requerimiento" placeholder="Nombre Requerimiento">
              </div>
              <div class="form-group  col-md-2">
                <label class="sr-only" for="no_horas_req">N° Horas</label>
                <input type="text" name="requerimiento[0][no_horas_req]"  class="form-control" id="no_horas_req" placeholder="No. Horas">
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
       		props: ['hAreaDiseno'],
      data () {
          return {
          requerimiento: [
              {nombre_requerimiento: 'requerimiento[0][nombre_requerimiento]', no_horas_req: 'requerimiento[0][no_horas_req]'}
          ]
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
