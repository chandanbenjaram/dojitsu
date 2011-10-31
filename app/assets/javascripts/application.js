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
/*
;
(function($j) {   
	$j(function() {  
		var currentTabVal = localStorage.getItem("DOJO_GLOBALS.currentTab");
		if(currentTabVal != undefined && currentTabVal){  

 		var currentTabEle = $j(".homenavbar li:contains('"+ currentTabVal +"')");              
				$j(currentTabEle).addClass('active');						
				// I dont think following block make sense to me here, thus commented it out for now. (Chandan)
 			if(!$j(currentTabEle).hasClass('active')){
				$j(currentTabEle).addClass('active');						
			}
		}

	});
		
	$j('.homenavbar li').live('click', function(e){
		if(typeof(localStorage) === 'undefined'){
			return -1;
		}            
			localStorage.setItem("DOJO_GLOBALS.currentTab", $j(this).text());			
			$j(this).addClass('active');  
			$j(this).siblings().removeClass('active');			
				});
				})(jQuery);
				
				*/
				