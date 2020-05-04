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
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery 
//= require bootstrap
//= require js.cookie
//= require("trix")
//= require("@rails/actiontext")

function select_tag(element){
    var name = element;
    var current_class = name.className;
    if(current_class == "badge"){
        name.className = "badge badge-pill badge-warning";
    } else {
        name.className = "badge";
    }
}


function select_opt(element){
    var name = element.parentElement;
    var current_class = name.className;
    if(current_class == "list-group-item"){
        var active = document.getElementsByClassName("list-group-item active");
        active[0].className = "list-group-item"
        name.className = "list-group-item active";
    } 
}

function selevt_nav_item(){
    var active = document.getElementsByClassName("nav-link active");
    active[0].className = "nav-link"
    var item = document.getElementById("topic_select");
    item.className = "nav-link active";
}

function display_reply(id){
    var element = document.getElementById(id)
    if(element.className == "reply-box"){
        element.className = "display-reply-box"
    }
    else{
        element.className == "reply-box"
    }
}
