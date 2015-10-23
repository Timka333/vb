// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .
$( document ).ready(function() {
  // After 5 seconds, fadeout login success msg	
  $(".alert-success").delay(5000).slideUp('slow');

  //Todolist 
    $(".cancel_tdl_button").click(function(){
        $(".new_tdl_form").hide();
        $(".add_tdl_button").show();
    });
    $(".add_tdl_button").click(function(){
        $(".new_tdl_form").show();
        $(".add_tdl_button").hide();
        $("#todolist_title").focus();
    });

  // Todolist item
    $(".cancel_tdli_button").click(function(){
        current_tdl_id = $(this).attr('data-tdl-id');
        $("." + current_tdl_id).hide();
        $(".add_tdli_button_" + current_tdl_id ).show();
    });
    $(".add_tdli_button").click(function(){
        current_tdl_id = $(this).attr('data-tdl-id');
        $("." + current_tdl_id).show();
        $(".add_tdli_button_" + current_tdl_id ).hide();
        $(".todolistitem_title_" + current_tdl_id).focus();
    });

    //check todolist item finished
    // $(".finished_check").click(function(){
    //    current_tdli_id = $(this).attr('id');
    //    console.log(current_tdli_id);
    //});

});