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
					window.fbAsyncInit();
					FB.api({
						method: 'fql.multiquery',
						return_ssl_resources: 1,
						queries: {
							"mThreadQ" : "SELECT thread_id, recipients, subject, snippet,updated_time,viewer_id FROM thread WHERE folder_id = 1 order by updated_time asc limit 1", 
							"mMessageQ": "SELECT author_id, created_time, body, attachment,viewer_id FROM message WHERE thread_id IN (SELECT thread_id from #mThreadQ)  order by created_time desc limit 1"
							},
							}, function(response){
								if(response && response[0] && response[1]){
									var messageLog = $.extend({}, response[0].fql_result_set[0], response[1].fql_result_set[0]);  
									// call rails to put entry into messages table
									messageLogSmall=new Object();
									messageLogSmall.recipients =messageLog.recipients;
									messageLogSmall.name =messageLog.attachment.name;
									messageLogSmall.body =messageLog.body;
									messageLogSmall.author_id =messageLog.author_id;
									jQuery.support.cors = true;     
									$.get('/messages/storemessage', 
									{messageDetails:messageLogSmall},
									function(data) {

										}, 'script'
										);
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