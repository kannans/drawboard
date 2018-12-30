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
//= require activestorage
//= require turbolinks
//= require_tree .


$(document).ready(function(){
  $.ajaxSetup({
    headers: { 'X-CSRF-Token': $("meta[name='csrf-token']").attr('content') }
  });
  $('td.js-fill-color').on('click', function(event) {
    var color = "#" + $(".jscolor").val();
    element = $(event.target)
    element.css('background-color', color);
    var username = $('#js-grid-board').data('username');
    var position = element.data('position')
    var color = color;

    var data = {
      user: username,
      position: position,
      color: color
    }
    $.post('/drawcolor', data);
  })
})

