// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery(document).ready(function($) {
	    $('b.load-local').cluetip({
			width:640,
			height:225,
			local:true, 
			//cursor: 'pointer',
			//sticky: true,
			//closePosition: 'title',
	  		dropShadow: false,
			cluetipClass: 'jtip',
			//mouseOutClose: true,
			arrows: true
		});
		
	// script for change containt of social and personl challenge
	$('ul.tabs li').click(function(event){
		var ty = event.target.id;
		if( ty == "soc")
		{
			//alert("soc");
			$('#soc_wn').val("");
			$('#soc_hm').val("");
		}
		else
		{
			//alert("per");
			$('#per_wn').val("");
		}
	});
	
	// Add row for new task
	//alert("hiiiiiiiii");
	//$(".alternativeRow").btnAddRow({oddRowCSS:"oddRow",evenRowCSS:"evenRow"});
	//$(".delRow").btnDelRow();
	
	$(".addRow").btnAddRow();
	$(".delRow").btnDelRow();
	
	//$(".addComment").btnAddRow({rowNumColumn:"rowNumber"});
	//$(".delRow").btnDelRow();
	
	
	// Date Picker scripting code
	//alert("Date picker is working");
	$('.date-pick').datePicker({startDate:'01/01/1996'});
	
	//script for changing start point
    $('#ch_st_date').change(function() {
		console.debug('changed...' + $(this));

	});
	
	// script for changing end point
	$('#ch_ed_date').change(function() {
		console.debug('changed...' + $(this));

	});
	
	// script for challenge 
	$('.chall_type').click(function(){
		if ($(this).attr("id") == "challenge_cha_type_per")
		{
			//alert($(this).attr("id"));
			$("#challenge_cha_type_per_div").show("fast");
			$("#challenge_cha_type_soc_div").hide("fast");
		}
		else
		{
			//alert($(this).attr("id"));
			$("#challenge_cha_type_soc_div").show("fast");
			$("#challenge_cha_type_per_div").hide("fast");
		}
		//$("<div></div>").appendTo("div#new_tsk_field");
	});
	
	/*
	// script for tool tip
	$("#download_now").tooltip({ 
		offset: [10, 2],
		effect: 'slide',
		position: "top right"
	});
	*/
	
	// script for clue tip
	$('#download_now').cluetip({attribute: 'id'});
	
	// script for start date
	$('#ch_st_date').change(function() {
		var sel_val = $(this).val();
		//alert("hiiiiiii")
		//alert("new"+sel_val);
		//$('#ch_st_date').hide();
		if ($(this).val() == "#ch_st_dat")
		{
			//alert("date");
			$(sel_val).show();
			$('#ch_st_num').hide();
			$('#st_nv').val("");
			$('#st_nl').val("");
		}
		else
		{
			//alert("number");
			$(sel_val).show();
			$('#ch_st_dat').hide();
			$('#st_dv').val("");
		}

	});
	
	// script for end date
	$('#ch_ed_date').change(function() {
		var sel_val = $(this).val();
		//alert("hiiiiiii")
		//alert("new"+sel_val);
		//$('#ch_st_date').hide();
		if ($(this).val() == "#ch_ed_dat")
		{
			//alert("date");
			$(sel_val).show();
			$('#ch_ed_num').hide();
			$('#ed_nv').val("");
			$('#ed_nl').val("");	
		}
		else
		{
			//alert("number");
			$(sel_val).show();
			$('#ch_ed_dat').hide();
			$('#ed_dv').val("");
		}

	});
	
	//pop up for task creation hint
	//alert("hiiiii")
	$('.reset_password_popup').colorbox();

});