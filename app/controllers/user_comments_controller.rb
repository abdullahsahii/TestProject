class UserCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @comments = UserComment.all
  end
  def new
    @character = Character.find(params[:character_id])
    @comment = @character.user_comments.build
  end

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
    @character = Character.find(params[:character_id])
    @comment = @character.user_comments.find(params[:id])
  end

  def update
    @character = Character.find(params[:character_id])
    @comment = @character.user_comments.find(params[:id])

    if @comment.user == current_user
      if @comment.update(comment_params)
        redirect_to character_path(@character), notice: 'Comment was successfully updated.'
      else
        render :edit
      end
    end
  end


  def destroy
    @character = Character.find(params[:character_id])
    @comment = @character.user_comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to character_path(@character)}
      format.js
    end
  end

  private

  def comment_params
    params.require(:user_comment).permit(:person_name, :comment, :rating)
  end
end