
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

Vue.component('example', require('./components/Example.vue'));
Vue.component('select_clientes', require('./components/clientes.vue'));
Vue.component('select_usuarios', require('./components/select_usuarios.vue'));
Vue.component('select_estados', require('./components/select_estado.vue'));

import Datepicker from 'vuejs-datepicker';

const app = new Vue({
    el: '#app',
    components: {
      Datepicker
    },
    data:{
      hDisponibles:10,
      url:''
    }
});
