(function() {
  var e = document.createElement('script');
  e.type = 'text/javascript';
  e.src = document.location.protocol +
    '//connect.facebook.net/en_US/all.js';
  e.async = true;
  document.getElementById('fb-root').appendChild(e);

        FB.ui({method: 'apprequests',
          message: 'My Great Request',
        }, requestCallback);
		

      }
      
      function requestCallback(response) {
        // Handle callback here
      }

	  
// to send request to single friend use this function 
      function sendRequestToOneRecipient() {
        var user_id = document.getElementsByName("user_id")[0].value;
        FB.ui({method: 'apprequests',
          message: 'My Great Request',
          to: user_id, 
        }, requestCallback);
      }
// to send request to many friends use this function
      function sendRequestToManyRecipients() {
        FB.ui({method: 'apprequests',
          message: 'My Great Request',
        }, requestCallback);
      }
      
      function requestCallback(response) {
        // Handle callback here
      }
	  
	  FB.Canvas.setSize({ width: 640, height: 480 });
	
     window.fbAsyncInit();

     
   
      function sendRequestToManyRecipients() {

        FB.ui({method: 'apprequests',
          message: 'My Great Request',
		  maximum: '50',
        }, requestCallback);
         /*FB.ui({
         // method: 'send',
        //  name: 'My dojitsu challenge',
         // link: 'http://dev.dojitsu.com/',
          });*/
		  
		
      }
      

      function requestCallback(response) {
        console.log(response);
 
      }
