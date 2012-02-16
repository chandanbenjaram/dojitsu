

  $(document).ready(function() {
        var tabContainers = $('div.tabs > div');
        tabContainers.hide().filter(':first').show();

        $('div.tabs ul.tabNavigation a').click(function () {
            tabContainers.hide();
            tabContainers.filter(this.hash).show();
            $('div.tabs ul.tabNavigation a').removeClass('selected');
            $(this).addClass('selected');
            return false;
        }).filter(':first').click();
    });



  $(document).ready(function(){
    $("#myfrd").click(function(){      
      if ($('#myfrd').attr('checked')) 
      {
          $("#pStatusAll").hide();
          $("#pStatusMy").show();
      }
      else
      {         
          $("#pStatusMy").hide();
          $("#pStatusAll").show();
      }
    });    
  });



  $(document).ready(function() {
      // call the tablesorter plugin
      $("table").tablesorter({
              // sort on the first column and third column, order asc
              sortList: [[0,0],[1,0]]
      });
  }); 




