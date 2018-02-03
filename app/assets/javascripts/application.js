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
//
//= require rails-ujs
//= require jquery
//= require bootstrap
//= require_tree .
//= require sweetalert

$(function(){
    var maxlength = 140;
    $('textarea').on('keyup keydown keypress change', function(){
       var thisValueLength = $(this).val().length;
       var countlength = (maxlength)-(thisValueLength );
       $('.count').html(countlength);
       if (countlength > 0){
           $('.count').css({color:'green',fontWeight:'bold'});
           $('textarea').css({borderColor:'#1bb4d3'});
       } else {
           $('.count').css({color:'red',fontWeight:'normal'});
           $('textarea').css({borderColor:'red'});
       }
    });
});
