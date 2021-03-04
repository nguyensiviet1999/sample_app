$('body').on("click",".reaction-comment",function(){
  var comment_id = $(this).data("comment_id")
  var emoji_id = $(this).data("emoji_id")
  var reaction_data = {
    "data": {
      "comment_id": comment_id,
      "emoji_id": emoji_id
    }
  }
  var collapse_target_id = $(this).parent().attr('id')
  var comment_target_href = `[href='#${$(this).parent().attr('id')}']`
  $(comment_target_href).children('.fa-thumbs-up').attr('hidden','hidden')
  var count_reaction = parseInt($(comment_target_href).children("sub").text())
  var data_emoji = `[data='${$(this).children().text()}']`
  $(`#${collapse_target_id}`).collapse('hide')
  const token = document.getElementsByName("csrf-token")[0].content;
  $.ajax({
    type: "post",
    url: "../reaction_comments",
    data: reaction_data,
    dataType: "json",
    success: function (response) {
      var reaction_comment_target = `#reaction_comment${comment_id}`
      $(comment_target_href).children("sub").html(response['reaction_comment_count']  )
      if(parseInt(response['reaction_comment_count']) == 0){
        $(comment_target_href).children('.fa-thumbs-up').removeAttr('hidden')
      }
      $(reaction_comment_target).html("")
      $(reaction_comment_target).append(response['comment_emojis'].toString())
    } 
  })
});