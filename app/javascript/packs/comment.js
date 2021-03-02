$('body').on("click",".reaction-comment",function(){
	var collapse_target_id = $(this).parent().attr('id')
	var comment_target_href = `[href='#${$(this).parent().attr('id')}']`
	$(comment_target_href).children('.fa-thumbs-up').replaceWith("");
	var count_reaction = parseInt($(comment_target_href).children("sub").text())
	var data_emoji = `[data='${$(this).children().text()}']`
	if($(this).data('control') == "on"){
		$(this).data('control','off')
		$(comment_target_href).children(data_emoji).removeAttr('hidden')
		$(comment_target_href).children("sub").html(count_reaction + 1)
	}
	else{
		$(this).data('control','on')
		$(comment_target_href).children(data_emoji).attr('hidden','hidden')
		$(comment_target_href).children('sub').html(count_reaction - 1)
	}
	$(`#${collapse_target_id}`).collapse('hide')
});
