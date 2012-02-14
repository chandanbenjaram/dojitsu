
$(document).ready(function(){
	$("#againstmyself").show();
	 $("#againstother").hide();
	$("#first").change(function()
	{
		 var myfre = $("#first").val();
		 if(myfre == "others")
		 {
			 $("#againstmyself").hide();
			 $("#howamdoing").replaceWith($("#againstother").show());
		 }
		 else 
		 {
			 $("#againstother").hide();
			 $("#howamdoing").replaceWith($("#againstmyself").show());
		 }
	});

});

$(document).ready(function(){
$(".new_message_button").click(function(){
        $.colorbox({
              opacity: 0.40,
              transition: 'none',
              speed: 200,
              width: 460,
              scrolling: true,
              inline:true, 
              href:"#sendNewMessage",
              title: '',
              overlayClose: true,
              onComplete: function () {
                  // $(this).initFunctions(); // if you want to reinit another colorbox, you should pass the element as an argument to initFunctions rather than calling this as a blanket initializer for all colorboxes.
              }              
          });
    });
    
    });
    
$(document).ready(function() 
		{ 
			$("#myTable").tablesorter(); 
		} 
	); 
	
$(document).ready(function() { 
	
		$("#myTable").tablesorter( {sortList: [[0,0],[1,0]] } ); 
		
	}); 