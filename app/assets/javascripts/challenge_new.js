
  $(document).ready(function() { 
    $('b.load-local').cluetip({
		width:640,
		height:225,
		local:true, 
		
  		dropShadow: false,
		cluetipClass: 'jtip',
		
		arrows: true
	});
  }); 

jQuery(document).ready(function($) {
	$('ul.tabs li').click(function(event){
		var ty = event.target.id;
		if( ty == "soc")
		{
		
			$('#soc_wn').val("");
			$('#soc_hm').val("");
		}
		else
		{
		
			$('#per_wn').val("");
		}
	});
	

	$(".alternativeRow").btnAddRow({oddRowCSS:"oddRow",evenRowCSS:"evenRow"});
	$(".delRow").btnDelRow();
	

	$('.date-pick').datePicker({startDate:'01/01/1996'});
	

	$('.chall_type').click(function(){
		if ($(this).attr("id") == "challenge_cha_type_per")
		{
		
			$("#challenge_cha_type_per_div").show("fast");
			$("#challenge_cha_type_soc_div").hide("fast");
		}
		else
		{
	
			$("#challenge_cha_type_soc_div").show("fast");
			$("#challenge_cha_type_per_div").hide("fast");
		}
		
	});

	$('#download_now').cluetip({attribute: 'id'});
	
	
	$('#ch_st_date').change(function() {
		var sel_val = $(this).val();
	
		if ($(this).val() == "#ch_st_dat")
		{
		
			$(sel_val).show();
			$('#ch_st_num').hide();
			$('#st_nv').val("");
			$('#st_nl').val("");
		}
		else
		{
	
			$(sel_val).show();
			$('#ch_st_dat').hide();
			$('#st_dv').val("");
		}

	});
	

	$('#ch_ed_date').change(function() {
		var sel_val = $(this).val();

		if ($(this).val() == "#ch_ed_dat")
		{
		
			$(sel_val).show();
			$('#ch_ed_num').hide();
			$('#ed_nv').val("");
			$('#ed_nl').val("");	
		}
		else
		{
			
			$(sel_val).show();
			$('#ch_ed_dat').hide();
			$('#ed_dv').val("");
		}

	});
	
	
	$('.reset_password_popup').colorbox();

});


	function validate_form_fields()
	{
		if(document.challenge_form.challenge_title.value=="")
		{
			document.getElementById("title").innerHTML="<font color=\"#FF0000\">Please enter title!</font>";
			document.challenge_form.challenge_title.focus();
			return false;
		}
		
		if ((document.challenge_form.challenge_title.value.length < 1) || (document.challenge_form.challenge_title.value.length > 30))
		{
			document.getElementById("title").innerHTML="<font color=\"#FF0000\">Title must be between one and 30 characters</font>";
			document.challenge_form.challenge_title.focus();
			return false;
		}
		
		if(document.challenge_form.ch_st_date.value=="")
		{
			document.getElementById("st_point").innerHTML="<font color=\"#FF0000\">Date or Number must be selected!</font>";
			document.challenge_form.ch_st_date.focus();
			return false;
		}
		
		if(document.challenge_form.ch_ed_date.value=="")
		{
			document.getElementById("ed_point").innerHTML="<font color=\"#FF0000\">Date or Number must be selected!</font>";
			document.challenge_form.ch_ed_date.focus();
			return false;
		}
		
		if (Date.parse(document.challenge_form.st_dv.value) > Date.parse(document.challenge_form.ed_dv.value))
		{
			document.getElementById("date_must_g").innerHTML="<font color=\"#FF0000\">End point must be equal to or later than start point.!</font>";
			document.challenge_form.ed_dv.focus();
			return false;
		}
		
		if(isNaN(document.challenge_form.st_nv.value))
		{
			document.getElementById("st_nv_div").innerHTML="<font color=\"#FF0000\">Please enter a number in the Number field!</font>";
			document.challenge_form.st_nv.focus();
			return false;
		}
		
		if(isNaN(document.challenge_form.ed_nv.value))
		{
			document.getElementById("ed_nv_div").innerHTML="<font color=\"#FF0000\">Please enter a number in the Number field!</font>";
			document.challenge_form.ed_nv.focus();
			return false;
		}
		
		if(document.challenge_form.challenge_task_attributes__score.value=="")
		{
			document.getElementById("challenge_task_attributes__score_by_div").innerHTML="<font color=\"#FF0000\">Please add at least one task!</font>";
			document.challenge_form.challenge_task_attributes__score.focus();
			return false;
		}
		
		if (document.challenge_form.st_dv.value =="")
		{
			if ((document.challenge_form.st_nv.value == "") || (document.challenge_form.st_nl.value == "")) {
				document.getElementById("st_nl_div").innerHTML = "<font color=\"#FF0000\">Please enter a number and label!</font>";
				document.challenge_form.st_nl.focus();
				return false;
			}	
		}
		
		if (document.challenge_form.ed_dv.value =="")
		{
			if ((document.challenge_form.ed_nv.value == "") || (document.challenge_form.ed_nl.value == "")) {
				document.getElementById("ed_nl_div").innerHTML = "<font color=\"#FF0000\">Please enter a number and label!</font>";
				document.challenge_form.ed_nl.focus();
				return false;
			}	
		}
		
	}

