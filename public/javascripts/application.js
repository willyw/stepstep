$(document).ready(function(){



	
	$("#add-description").click(function(){
		$(this).hide();
		$("#add_step_description").show();
	});
	
	$("#step_description").focus(function(){
		$("#submit-description").show();
	});
	
	$("#step-desc ").click(function(){
		$(this).hide();
		$("#add_step_description").show();
		$("#step_description").focus();
	});
	
	// $("#step_description")
	
	$("#add_step_description").submit(function(){
		var $form = $(this);
		var data_serialized = $form.serialize();
		var destination = $form.attr('action');
		$("#ajax-uploader").show();
		$.ajax({
			type: "POST",
			url: destination,
			data: data_serialized,
			datatype : 'script',
			success: function(response){
				$("#ajax-uploader").hide();
				alert(response);
				$("#add_step_description").hide();
				// $("#step-desc ").text( response );
				$("#step-desc ").show();
			}
		});
		
		return false;
	});
	
	$("#edit-description").click(function(){
		$("#add_step_description").show();
		return false;
	});
	
	$("#add-more-step").click(function(){
		var currentStep = $("div.steps").length;
		if( currentStep == 0 ){
			$('#step-template').clone().processStepTemplate().insertAfter("#post-header" );
		} else {
			$('#step-template').clone().processStepTemplate().insertAfter("#step-" + currentStep );
		}
		return false;
	});
	
	// new nicEditor({
	// 	iconsPath : '/javascripts/nicEditorIcons.gif'
	// }).panelInstance('step_description');
	
	$("#edit_step").submit(function(){
		var data_serialized = $(this).serialize();
		
		$.ajax({
			type: "POST",
			url: $(this).attr('action'),
			data: data_serialized,
			datatype : 'script',
			success: function(response){
				alert("Data saved");
			}
		});
		return false;
	});
	
	$("#explanation-toggle").toggle(function(){
		
	}, function(){
		
	});
});




$.fn.extend({
	processStepTemplate : function(){
		var currentStep = $("div.steps").length;
		var nextStep = currentStep + 1 ;
		$currentNode = $(this);
		// alert("The $currentNode id is " + $currentNode.attr('id'));
		$currentNode.attr("id", "step-"+ nextStep );
		// alert("The $currentNode id is " + $currentNode.attr('id'));
		$currentNode.addClass("steps");
		// alert("The $currentNode classes is " + $currentNode.attr('class'));
		var $currentInput = $("input", $currentNode );
		$currentInput.attr("id", "step_title-" + nextStep );
		$currentInput.attr("name", "step[title_" + nextStep +   "]"  );
		// alert("The id of input is " + $("input", $currentNode).attr("id"));
		var $currentLabel = $("label", $currentNode );
		$currentLabel.text("Step " + nextStep );
		$currentLabel.attr("for", "step_title-" + nextStep);
		// alert("The text of label is " + $("label", $currentNode ).text() );
		return this;
	},
	spitId : function(){
		var $currentNode  = $(this);
		// alert("The id of spit id is " + $currentNode.attr("id"));
	}
});


//jQuery("div").myMethod();

// $.extend({
//     myMethod2: function(){...}
// 
// });

//jQuery.myMethod()
