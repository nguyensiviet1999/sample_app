class CommentsController < ApplicationController
  before_action :correct_user, only: :destroy

  def show; end

  def create
    @micropost = Micropost.find(params[:comment][:micropost_id])
    @parent_comment_id = params[:comment][:parent_comment_id]
    @comment = current_user.comments.build(comment_params)
    @emojis = Emoji.all
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @comment }
        format.js
      end
    else
      flash[:danger] = "Loi trong luc luu comment"
      redirect_to root_url
    end
  end

  def destroy
    respond_to do |format|
      format.html { redirect_to @comment }
      format.js
    end
    if @comment.destroy
      flash[:success] = "Comment deleted"
    else
      redirect_to @comment.micropost
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :micropost_id, :parent_comment_id)
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to root_url if @comment.nil?
  end
end
