$(document).ready(function(){
	// find the destination
	
	
	$("#uploadify").uploadify({
		'uploader'       : '/javascripts/uploadify.swf',
		'script'         : $("#uploadify").attr('destination'),
		'cancelImg'      : '/images/cancel.png',
		'queueID'        : 'fileQueue',
		'folder'         : 'uploads',
		'auto'           : true,
		'multi'          : true,
		'buttonText'	: "Upload Pictures"
	
	});
	
	
	$("#add-more-step").click(function(){
		// alert("Boom boom boom, i am clicked");
		var currentStep = $("div.steps").length;
		
		if( currentStep == 0 ){
			// alert("Yeah, currentStep is 0");
			$('#step-template').clone().processStepTemplate().insertAfter("#post-header" );
			// $('#step-template').clone().processStepTemplate().spitId();
		} else {
			$('#step-template').clone().processStepTemplate().insertAfter("#step-" + currentStep );
		}
		
		return false;
	});
	
	// new nicEditor({
	// 	iconsPath : '/javascripts/nicEditorIcons.gif'
	// }).panelInstance('step_description');
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
