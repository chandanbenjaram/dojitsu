(function($) {
    $.dojitsuAjaxPage ={
        renderAjaxPageLoad : function(aUrl,aDiv,aDiv1,callback){ 
            $.ajax({
              url: aUrl, 
              cache: false,
              beforeSend: function( ) {
                $(aDiv1).append("loading...");
              },
              success: function(html){
                $(aDiv1).empty();
                $(aDiv).append(html); 
               },
              error: function( ) {
                $(aDiv1).append("...error loading...");
              }
            });
        }
    }	
})(jQuery);		