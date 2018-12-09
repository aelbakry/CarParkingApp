// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require jquery-ui/widgets/datepicker
//= require bootstrap
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$('.dropdown-toggle').dropdown()

$(document).ready(function() {
  
  $("#search_button").click(function() {
    var $search = $('#search_text').val().trim();
    if (!$search.length){
      alert('Please enter where you want to park today.');
     $("#fade").fadeOut("slow");
    }
  });

  $("#contact_button").click(function() {
    var $name = $('#name_field').val().trim();
    var $email = $('#name_field').val().trim();
    var $telephone = $('#name_field').val().trim();

    if ((!$name.length || !$email.length || !$telephone.length) == 0){

      alert('Please check that all fields are filled!');

    }

  });


  $("#book_button").click(function() {
    var $today = new Date();
    $today.setHours(0,0,0,0);
    var $search = $('#booking_date').datepicker('getDate')
    if ($search < $today)
        alert('How are you today?');
  });
});
