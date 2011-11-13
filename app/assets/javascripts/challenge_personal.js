$("document").ready(function(){
										$(".addComment").btnAddRow({rowNumColumn:"rowNumber"});
										$(".delRow").btnDelRow();
									});		

$("document").ready(function(){
								$(".addComment").btnAddRow({rowNumColumn:"rowNumber"});
								$(".delRow").btnDelRow();
								});

jQuery(document).ready(function($) {

$(".editable").editable("http://www.example.com/save.php", { 
    method : "PUT"
});

$(".editable").editable("http://www.example.com/save.php", { 
    settings.submit : '<button type="submit">Save</button>'
});

$(".editable").editable("http://www.example.com/save.php", { 
    settings.submit : 'Save'
});
 $('.editable1').editable({
    type:'text',
    submit:'update',
    cancel:'cancel',
    editClass:'resultItem',
    onSubmit:end
    }); 

$('.editable2').editable({type:'textarea',submitBy:'dblclick'}).css('background-color','#39c');
$(function(){

    $('.editable1').editable({onEdit:begin});
    function begin(){
    this.append('Click somewhere else to submit');
    }
    }); 
       $('.editable3').editable({
    type:'text',
    submit:'save',
    onSubmit:end
    }); 

	$('div.editable').editable()
	    $(function(){
    $('.editable1').editable({onEdit:begin});
    function begin(){
    this.append('Click somewhere else to submit');
    }
    }); 
	// Add row for new task
	//alert("hiiiiiiiii");
	$(".alternativeRow").btnAddRow({oddRowCSS:"oddRow",evenRowCSS:"evenRow"});
	$(".delRow").btnDelRow();
	
	// Date Picker scripting code
	//alert("Date picker is working");
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
		
	});
	
	
});
$('.editable2').editable({type:'textarea',submitBy:'dblclick'}).css('background-color','#39c');
