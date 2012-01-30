(function($) {
	$.dojitsu ={
		renderSendBox : function(subject, to, link, message, callback){
			window.fbAsyncInit();
			FB.ui({
				method: 'send',  
				to: to,
				name: subject,
				link: link,
				text: message,
				message: message,
				data: message,
				}, function(response){
					$.dojitsu.messageCallBack(response, subject); 
					if(callback && typeof callback === 'function'){
						callback(response);
					};
					})	
					},
					messageCallBack : function(response){  	
						if(response === null){ 
							return; 
						}  
						window.fbAsyncInit();
						FB.api({
							method: 'fql.multiquery',
							return_ssl_resources: 1,
							queries: {
								"mThreadQ" : "SELECT thread_id, snippet, recipients, snippet FROM thread WHERE folder_id='1' ORDER BY updated_time DESC LIMIT 1", 
								"mMessageQ": "SELECT author_id, created_time, body, attachment, viewer_id FROM message WHERE thread_id IN(SELECT thread_id from #mThreadQ) ORDER BY created_time DESC LIMIT 1"
								},
								}, function(response){
									if(response && response[0] && response[1]){
										var messageLog = $.extend({}, response[0].fql_result_set[0], response[1].fql_result_set[0]);  
										// call rails to put entry into messages table
										var message = new Object();
										message.from = messageLog.author_id;										
										message.to = messageLog.recipients;
										message.subject = messageLog.attachment.name;
										message.body = messageLog.body;
										// grab snippet
										// post to recipients board
										// jQuery.support.cors = true;     
										$.post('/messages/storemessage', message);
									}
									}) 
									},							

									renderAppReqBox : function(name, to, link, message){
										window.fbAsyncInit();
										FB.ui({
											method: 'apprequest',  
											to: to,
											name: name,
											link: link,
											text: message,
											message: message,
											data: message		
											});	
											},
										};

										})(jQuery);				