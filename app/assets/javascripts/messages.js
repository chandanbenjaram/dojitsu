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
				}, function(response){$.dojitsu.messageCallBack(response, subject); callback(response);})	
				},
				messageCallBack : function(response){  
					if(response == null){
						return; 
					}
					window.fbAsyncInit();
					FB.api({
						method: 'fql.multiquery',
 						return_ssl_resources: 1,
						queries: {
							"mThreadQ" : "SELECT thread_id, recipients, subject, snippet FROM thread WHERE folder_id = 1 order by updated_time desc limit 1", 
							"mMessageQ": "SELECT author_id, created_time, body, attachment FROM message WHERE viewer_id = me() and thread_id IN (SELECT thread_id from #mThreadQ)"
							},
							}, function(response){
								if(response && response[0] && response[1]){
									var messageLog = $.extend({}, response[0].fql_result_set[0], response[1].fql_result_set[0]);  
									// call rails to put entry into messages table
									console.debug("REMOVE IT messageLog...", messageLog);
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