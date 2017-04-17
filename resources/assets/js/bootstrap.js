
window._ = require('lodash');

/**
 * We'll load jQuery and the Bootstrap jQuery plugin which provides support
 * for JavaScript based Bootstrap features such as modals and tabs. This
 * code may be modified to fit the specific needs of your application.
 */

window.$ = window.jQuery = require('jquery');
require('bootstrap-less');


var AdminLTEOptions = {
    //Enable sidebar expand on hover effect for sidebar mini
    //This option is forced to true if both the fixed layout and sidebar mini
    //are used together
    sidebarExpandOnHover: true,
    //BoxRefresh Plugin
    enableBoxRefresh: true,
    //Bootstrap.js tooltip
    enableBSToppltip: true,
    //Add slimscroll to navbar menus
  //This requires you to load the slimscroll plugin
  //in every page before app.js
  navbarMenuSlimscroll: true,
  navbarMenuSlimscrollWidth: "3px", //The width of the scroll bar
  //Activate sidebar slimscroll if the fixed layout is set (requires SlimScroll Plugin)
  sidebarSlimScroll: true,
  }

require('jquery-slimscroll');
require('admin-lte');
window.toastr = require('toastr');
require('icheck');
window.numeral = require('numeral');

import moment from 'moment';
moment.locale('es');
/**
 * Vue is a modern JavaScript library for building interactive web interfaces
 * using reactive data binding and reusable components. Vue's API is clean
 * and simple, leaving you to focus on building your next great project.
 */

window.Vue = require('vue');
require('vue-resource');
// var dt      = require( 'datatables.net' )();
// Funciona instalando 'imports-loader'

// require('vue-sync')
import table from 'datatables.net-bs/js/dataTables.bootstrap.js';

// window.dt      = require('imports?define=>false!datatables.net')(window, $);
/**
 * We'll register a HTTP interceptor to attach the "CSRF" header to each of
 * the outgoing requests issued by this application. The CSRF middleware
 * included with Laravel will automatically verify the header's value.
 */

Vue.http.interceptors.push((request, next) => {
    request.headers.set('X-CSRF-TOKEN', Laravel.csrfToken);
    request.headers.set('Authorization', 'Bearer '+Laravel.api_token);


next();
});
//console.log(Laravel.api_token);
window._apiToken = Laravel.api_token;
window._baseURL = Laravel.baseUrl;
window._apiURL = Laravel.baseUrl+'/api/v1/';
/**
 * Echo exposes an expressive API for subscribing to channels and listening
 * for events that are broadcast by Laravel. Echo and event broadcasting
 * allows your team to easily build robust real-time web applications.
 */

import Echo from "laravel-echo"

window.Echo = new Echo({
    broadcaster: 'pusher',
    authEndpoint: window._baseURL+'/broadcasting/auth',
    // Para Producción DesComentar */
     key: '409d9424cbbfd96e6a8c',
    // Para Local DesComentar
    //key: 'd6a13b3892fbcd4a53a2',
    // cluster: 'eu',
    // encrypted: true
});

/*Pusher.log = function(message) {
	window.console.log(message)
}*/


$(document).ready(function(){
    $('[data-toggle="modal"]').tooltip();

       $(document).on('change', ':file', function() {
        var input = $(this),
            numFiles = input.get(0).files ? input.get(0).files.length : 1,
            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
        input.trigger('fileselect', [numFiles, label]);
      });

    // Input file imagen de perfil
       $(':file').on('fileselect', function(event, numFiles, label) {

          var input = $(this).parents('.input-group').find(':text'),
              log = numFiles > 1 ? numFiles + ' files selected' : label;

          if( input.length ) {
              input.val(log);
          } else {
              if( log ) alert(log);
          }

      });


        $(".img-circle-arriba").click(function () {
            var body = $("html, body");
            body.stop().animate({scrollTop:0}, '1500', 'swing');
        });



});
