(function($) {
    $.dojitsuAjaxPage ={
        renderAjaxPageLoad : function(aUrl,aDiv,aDiv1,callback){ 
            $.ajax({
              url: aUrl, 
              cache: false,
              beforeSend: function( ) {
              
                $(aDiv1).html("<img src='/assets/ajax-loader.gif' />");
              },
              success: function(html){
                $(aDiv1).text('Loading...').hide();
                $(aDiv).append(html); 
               }
            });
        }
    }	
})(jQuery);		