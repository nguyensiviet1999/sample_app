class EmojisController < ApplicationController
  def new
    @emoji = Emoji.new
  end

  def create
    emoji = Emoji.new(emoji_params)
    if emoji.save
      flash[:success] = "Successfully created..."
    else
      flash[:danger] = "Fail created..."
    end
    @emoji = Emoji.new
    render "emojis/new"
  end

  private

  def emoji_params
    params.require(:emoji).permit(:emoji_image)
  end
end
