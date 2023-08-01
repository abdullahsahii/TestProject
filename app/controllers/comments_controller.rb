class CommentsController < ApplicationController


  def index

  end
  def new

  end

  def create
    @character = Character.find(params[:character_id])
    @comment = @character.comments.create(comment_params)
    redirect_to character_path(@character)
  end
  def edit

  end

  def update

  end

  def destroy

  end

  def show

  end

  private
  def comment_params
    params.require(:comment).permit(:person_name, :comment)
  end
end
