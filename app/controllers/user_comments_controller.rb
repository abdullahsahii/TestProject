class UserCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @character = Character.find(params[:character_id])
    @comment = @character.user_comments.build
  end

  def create
    @character = Character.find(params[:character_id])
    @comment = @character.user_comments.build(comment_params) # learn this build method
    @comment.user = current_user

    if @comment.save
      redirect_to character_path(@character), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def edit
    @character = Character.find(params[:character_id])
    @comment = @character.user_comments.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])
    @comment = Usercomment.find(params[:id])
    if @comment.user == current_user
      if @comment.save
        redirect_to character_path(@character), notice: 'Comment was successfully created.'
      else
        render :edit
      end
    end
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