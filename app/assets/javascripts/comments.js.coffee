# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ($) ->
	
	$("#new_comment").submit ->
		$.ajax
		    url: window.location+"/comments.json"
		    type: "POST"
		    data: comment: 
		             name: $("#comment_name").val()
		             content: $("#comment_content").val()
		    success: (e)->
		    	$("#comments").prepend('<div class="comment well"><h5>'+e.name+'</h5><p>'+e.content+'</p></div').fadeOut(0).fadeIn(300)

		    error: (e)->
		    	$("#errors").html('<div class="alert alert-error" id="flash_notice">'+e.responseText+'</div>')

		return false