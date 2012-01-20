$(document).ready(function(){
    $(".new_message_button_index").click(function(){
        //alert("Maisa");
        $.colorbox({
              opacity: 0.40,
              transition: 'none',
              speed: 200,
              width: 450,              
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