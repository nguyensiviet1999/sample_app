class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def show
    @micropost = Micropost.find(params[:id])
    @comments = @micropost.comments.first_level
    @comment = @micropost.comments.build
    @emojis = Emoji.all
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @feed_items = current_user.feed.paginate(page: params[:page])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render "static_pages/home"
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
