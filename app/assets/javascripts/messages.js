(function($) {
	$.dojitsu ={
		renderSendBox : function(name, to, link, message){
			FB.init({appId: '232592880122189', status: true, cookie: true, xfbml: true});
			FB.ui({
				method: 'send',  
				to: to,
				name: name,
				link: link,
				text: message,
				message: message,
				data: message		
				});	
			}   
		};
		    
/*		renderAppReqBox : function(name, to, link, message){
			FB.init({appId: '232592880122189', status: true, cookie: true, xfbml: true});
			FB.ui({
				method: 'apprequest',  
				to: to,
				name: name,
				link: link,
				text: message,
				message: message,
				data: message		
				});	
			}   
		} */
				
		function requestCallback(response) {
			// Handle callback here 
			console.debug('response...', response)
		}   

		})(jQuery);