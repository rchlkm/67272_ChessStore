// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize
//= require_tree


$(document).ready(function() {

  $('.dropdown-button').dropdown();
  $(".button-collapse").sideNav();
	$('.collapsible').collapsible();


});

(function($) {
		$(function() {

$('.dropdown-button').dropdown({
      inDuration: 300,
      outDuration: 225,
      hover: true, // Activate on hover
      belowOrigin: true, // Displays dropdown below the button
      alignment: 'right' // Displays dropdown with edge aligned to the left of button
    }
  );

		}); // End Document Ready
})(jQuery); // End of jQuery name space



$('#mainMenu').on('click',function(){
 $('#dropdown1').toggle();
});




  

