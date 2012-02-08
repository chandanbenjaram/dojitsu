(function($) {
    $.dojitsuWallPost ={
        renderFbWallPost : function(){
			//alert("Maisa");
			window.fbAsyncInit();
			//alert("Pride");
			// calling the API ...
			var obj = {
				method: 'feed',
				link: 'http://www.dojitsu.com',
				picture: 'http://fbrell.com/f8.jpg',
				name: 'Dojitsu',
				caption: 'Do your best',
				description: 'Project management software for personal use in tracking the participants progress in social, athletic, personal or travel related tasks.'
			};

			function callback(response) 
			{
			   document.getElementById('msg').innerHTML = "Post ID: " + response['post_id'];
			}

			FB.ui(obj, callback);
		}
    }	
})(jQuery);		