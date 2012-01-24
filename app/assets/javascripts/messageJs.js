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

$(document).ready(function(){
    $(".iMessageNew").click(function(){
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

$(document).ready(function(){
    $(".initial").click(function(event){      
      var targetId = event.target.id;      
      var toAdd = targetId.split("_");      
      var showId = targetId.concat(toAdd[1])      
      $(targetId).hide();
      $(showId).show();
      //$(targetId).replaceWith($(showId).show());
    });
    
    $(".reply").click(function(event){      
      var targetId = event.target.id;      
      var toAdd = targetId.split("_");      
      var toAddAgain = toAdd[1].split("");      
      var showAdds = toAdd[0].concat("_");      
      var showAddId = showAdds.concat(toAddAgain[0]);      
      $(targetId).hide();
      $(showAddId).show();
      //$(targetId).replaceWith($(showAddId).show());
    });
    
  });

$(document).ready(function(){
    $("#demo a").tooltip();
});