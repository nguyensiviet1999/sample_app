class ReactionCommentsController < ApplicationController
  before_action :logged_in_user

  def create
    reaction_comment = current_user.reaction_comments.find_by(comment_id: reaction_comments_params["comment_id"])
    if reaction_comment
      if reaction_comment.emoji_id == reaction_comments_params["emoji_id"].to_i
        reaction_comment.destroy
      else
        reaction_comment.update(reaction_comments_params)
      end
    else
      current_user.reaction_comments.build(reaction_comments_params).save
    end
    comment = Comment.find(reaction_comments_params["comment_id"])
    render json: {
                  comment_emojis: comment.emojis.map(&:emoji_image),
                  reaction_comment_count: comment.reaction_comments.length,
                  user_reaction_comment_emoji: reaction_comment&.emoji_id
                }
  end

  private

  def reaction_comments_params
    params.require(:data).permit(:comment_id, :emoji_id)
  end
end
