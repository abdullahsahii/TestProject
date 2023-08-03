class UserCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  def create
    @character = Character.find(params[:character_id])
    @comment = @character.user_comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to character_path(@character), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def edit
    @character = Character.find(params[:id])
    @comment = Character.comment.find(params[:id])
  end

  def update

  end

  def destroy
    @character = Character.find(params[:character_id])
    @comment = @character.user_comments.find(params[:id])
    @comment.destroy
    redirect_to character_path(@character)
  end

  private

  def comment_params
    params.require(:user_comment).permit(:person_name, :comment, :rating)
  end
end