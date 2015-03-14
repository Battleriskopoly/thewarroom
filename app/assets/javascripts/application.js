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
//= require turbolinks
//= require faye
//= require comments
//= require_tree .
function add_fields(link, association, content) {
console.log($(link).parent())
        var new_id = 100000000000;
        var regexp = new RegExp("new_" + association, "g");
        $(link).parent().before(content.replace(regexp, new_id));
}
function clickButton(button_id) {
  document.getElementById(button_id).click();
  }

$(function() {

  var faye = new Faye.Client('http://localhost:9292/faye');
  faye.subscribe('/' + GameAttribute.id , function (data) {
   eval(data)
  });

});

