$(document).ready(function() {



	//When page loads...

	$(".tab_content1").hide(); 

	$(".tab_content3").hide(); //Hide all content

	$("ul.tabs1 li:first").addClass("active").show(); //Activate first tab

	$(".tab_content1:first").show();

	$(".tab_content3:first").show(); 	//Show first tab content



	//On Click Event

	$("ul.tabs1 li").click(function() {



		$("ul.tabs1 li").removeClass("active"); //Remove any "active" class

		$(this).addClass("active"); //Add "active" class to selected tab

		$(".tab_content1").hide(); 

		$(".tab_content3").hide();//Hide all tab content



		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content

		$(activeTab).fadeIn(); //Fade in the active ID content

		return false;

	});

});