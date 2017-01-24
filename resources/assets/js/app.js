
/**
 * First we will load all of this project's JavaScript dependencies which
 * include Vue and Vue Resource. This gives a great starting point for
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the body of the page. From here, you may begin adding components to
 * the application, or feel free to tweak this setup for your needs.
 */


Vue.component('select_clientes', require('./components/herramientas/select_clientes.vue'));
Vue.component('select_usuarios', require('./components/herramientas/select_usuarios.vue'));
Vue.component('select_estados', require('./components/herramientas/select_estado.vue'));
Vue.component('anadir_requerimiento', require('./components/anadir_requerimiento.vue'));

import Datepicker from 'vuejs-datepicker';

const app = new Vue({
    el: '#app',
    components: {
      Datepicker
    },
    data:{
      hDisponibles:0,
      htotal:0,
      hAreaDiseno:0
    }
});
