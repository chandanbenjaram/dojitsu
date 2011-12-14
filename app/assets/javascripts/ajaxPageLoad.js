(function($) {
    $.dojitsuUtile ={
        renderAjaxPageLoad : function(aUrl,aDiv,callback){
            $.ajax({
              url: aUrl,
              cache: false,
              success: function(html){
                $(aDiv).append(html);
          
               }
            });
        }
    }	
})(jQuery);		