
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

Vue.component('clientes', require('./components/clientes/clientes.vue'));
Vue.component('crear_cliente_form', require('./components/clientes/crear_cliente_form.vue'));
Vue.component('crear_listar_cliente', require('./components/clientes/crear_listar_cliente.vue'));

// Tarea
Vue.component('tarea', require('./components/tareas/tarea.vue'));
Vue.component('ver_tareas', require('./components/tareas/ver_tareas.vue'));
Vue.component('ver_tarea', require('./components/tareas/ver_tarea.vue'));
Vue.component('tareas_perfil', require('./components/tareas/tareas_perfil.vue'));

//Componentes Dsalazar
Vue.component('formulario_anadir_requerimiento', require('./components/ots/formulario_anadir_requerimiento.vue'));
Vue.component('listar_ots', require('./components/ots/listar_ots.vue'));
//Fin Componentes Dsalazar
//Componentes Bcaldas
Vue.component('form_usuarios', require('./components/usuarios/crear_usuario.vue'));
Vue.component('list_usuarios', require('./components/usuarios/listar_usuario.vue'));
Vue.component('roles', require('./components/roles/roles.vue'));
Vue.component('areas', require('./components/areas/areas.vue'));
Vue.component('listado_areas', require('./components/areas/listado_areas.vue'));
//Fin Componentes Bcaldas


const app = new Vue({
    el: '#app',
    
});
