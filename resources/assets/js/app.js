
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

Vue.component('listar_clientes', require('./components/clientes/listar_clientes.vue'));
Vue.component('crear_cliente_form', require('./components/clientes/crear_cliente_form.vue'));

//Componentes Dsalazar
Vue.component('formulario_anadir_requerimiento', require('./components/ots/formulario_anadir_requerimiento.vue'));
//Fin Componentes Dsalazar
//Componentes Bcaldas
Vue.component('form_usuarios', require('./components/usuarios/crear_usuario.vue'));
Vue.component('roles', require('./components/roles/roles.vue'));
Vue.component('areas', require('./components/areas/areas.vue'));
//Fin Componentes Bcaldas


const app = new Vue({
    el: '#app',
});
