// JavaScript Document
$(document).ready(function() {
	$('.summernote').summernote({ 
		height: 440,
		onkeyup: function(e) {
			$(this).parents('form').children('.btn').removeClass('btn-primary');
			$(this).parents('form').children('.btn').removeClass('btn-success');
			$(this).parents('form').children('.btn').addClass('btn-danger');
		},
		toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'italic', 'underline', 'clear']],
          ['fontsize', ['fontsize']],
          //['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          //['height', ['height']],
          ['table', ['table']],
          ['insert', ['link'/*, 'picture', 'video'*/]],
          ['view', ['fullscreen', 'codeview']],
          ['help', ['help']]
        ]
	});
	
	$('#thisweeksshare').summernote({ 
		height: 150,
		onkeyup: function(e) {
			$(this).parents('form').children('.btn').removeClass('btn-primary');
			$(this).parents('form').children('.btn').removeClass('btn-success');
			$(this).parents('form').children('.btn').addClass('btn-danger');
		},
		toolbar: [
			//['style', ['style']], // no style button
			['style', ['bold', 'italic', 'underline', 'clear']],
			//['fontsize', ['fontsize']],
			//['color', ['color']],
			['para', ['ul', 'ol', 'paragraph']],
			//['height', ['height']],
			['insert', ['link']], // no insert buttons
			//['table', ['table']], // no table button
			//['help', ['help']] //no help button
		  ]
	});
	
	$('form').submit(function(e) {
		var savebtn = $(this).children('.btn');
		/*if(savebtn.hasClass('btn-danger')){*/
			$.post(this.action, $(this).serialize(), function(returnData){
				savebtn.removeClass('btn-primary');
				savebtn.removeClass('btn-danger');
				savebtn.addClass('btn-success');
			});
		/*}*/
		return false;
    });
});