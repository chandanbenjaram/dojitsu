
$(document).ready(function(){
	
	
	
	
	$("#editme1").editInPlace({
		callback: function(unused, enteredText) { return enteredText; },
		// url: './server.php',
		show_buttons: true
	});

	// This example shows how to call the function and display a textarea
	// instead of a regular text box. A few other options are set as well,
	// including an image saving icon, rows and columns for the textarea,
	// and a different rollover color.
	$("#editme2").editInPlace({
		callback: function(unused, enteredText) { return enteredText; },
		
		bg_over: "#cff",
		field_type: "textarea",
		textarea_rows: "15",
		textarea_cols: "35",
		saving_image: "./images/ajax-loader.gif"
	});

	// A select input field so we can limit our options
	$("#editme3").editInPlace({
		callback: function(unused, enteredText) { return enteredText; },
		
		field_type: "select",
		select_options: "Change me to this, No way:no"
	});

	// Using a callback function to update 2 divs
	$("#editme4").editInPlace({
		callback: function(original_element, html, original){
			$("#updateDiv1").html("The original html was: " + original);
			$("#updateDiv2").html("The updated text is: " + html);
			return(html);
		}
	});
	
	$("#editme5").editInPlace({
		saving_animation_color: "#ECF2F8",
		callback: function(idOfEditor, enteredText, orinalHTMLContent, settingsParams, animationCallbacks) {
			animationCallbacks.didStartSaving();
			setTimeout(animationCallbacks.didEndSaving, 2000);
			return enteredText;
		}
	});
	
	
});