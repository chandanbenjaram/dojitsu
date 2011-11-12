//script code for hide and settings
	jQuery(document).ready(function($) {
    	$(".rem").click(function (str) {
			//alert($(this).attr("id"));
      		$($(this).attr("id")).hide("fast", function () {
        	// use callee so don't have to name the function
        	$(this).prev().hide("fast", arguments); 
      		});
			
    	});
    	$(".ad").click(function () {
		alert("Work on progress");
      	//$($(this).attr("id")).show(2000);
   		});
		
		
		//script code for bluff charts
		//alert("In Challenges bluff graph");
		var g = new Bluff.Line('example', '400x300');
    	g.title = 'My Charts';
    	g.tooltips = true;
    	g.theme_37signals();
    	g.data("Apples", [1, 2, 3, 4, 4, 3]);
    	g.data("Oranges", [4, 8, 7, 9, 8, 9]);
    	g.data("Watermelon", [2, 3, 1, 5, 6, 8]);
    	g.data("Peaches", [9, 9, 10, 8, 7, 9]);
    	g.labels = {0: '2003', 2: '2004', 4: '2005'};
    	g.draw();

		
		//script code for bluff charts
		//alert("In Challenges bluff graph");
		var g = new Bluff.SideBar('mychallenges', '400x300');
    	g.title = 'My Challenges';
    	g.tooltips = true;
    	g.theme_37signals();
    	g.data("Apples", [1, 2, 3, 4, 4, 3]);
    	g.data("Oranges", [4, 8, 7, 9, 8, 9]);
    	g.data("Watermelon", [2, 3, 1, 5, 6, 8]);
    	g.labels = {0: '2003', 2: '2004', 4: '2005'};
    	g.draw();				
		
		//script for datetime
		//alert("In dateeeeeeeee");
		$("#datepicker").datepicker();
	});