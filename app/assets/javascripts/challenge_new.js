
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
	
    $('#ch_st_date').change(function() {
		console.debug('changed...' + $(this));

	});
	
	
	$('#ch_ed_date').change(function() {
		console.debug('changed...' + $(this));

	});
	

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


