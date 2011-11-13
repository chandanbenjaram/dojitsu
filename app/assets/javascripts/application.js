// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//

//= require jquery
//= require jquery_ujs
//= require jquery-ui

function dojoFBLogout(e){ 
   	FB.logout();
};


/*
window.fbAsyncInit = function() {
    FB.init({
      appId      : '232592880122189', // App ID
      status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      oauth      : true, // enable OAuth 2.0
      xfbml      : true  // parse XFBML
    });

    // Additional initialization code here
	/* All the events registered */
   /* FB.Event.subscribe('auth.login', function(response) {
           // do something with response    
   alert('loggedin...');
           login();
       });
       FB.Event.subscribe('auth.logout', function(response) {
           // do something with response                     
   		alert('loggedOUT...');
           logout();
       });

       FB.getLoginStatus(function(response) {
           if (response.session) {
   			alert('loggedinSESSION...');
               // logged in and connected user, someone you know
               login();
   		}
      });
     };           
*/
