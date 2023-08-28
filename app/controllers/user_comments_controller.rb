class UserCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_character, only: [:new, :update, :create, :destroy]
  before_action :set_comment, only: [:update, :destroy]

  def new
    @comment = @character.user_comments.build
  end

  def create
    @comment = @character.user_comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to character_path(@character), notice: 'Comment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    begin
      @character = Character.find(params[:character_id])
      @comment = @character.user_comments.find(params[:id])
      if current_user.id == @comment.user_id

      else
        flash[:alert] = "You have not permission to edit the comment"
        redirect_to '/422.html'
      end
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "You have not permission to edit the comment"
      redirect_to '/404.html'

    end
  end

  def update
    if @comment.user == current_user
      if @comment.update(comment_params)
        redirect_to character_path(@character), notice: 'Comment was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to character_path(@character) }
      format.js
    end
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end

  def set_comment
    @comment = @character.user_comments.find(params[:id])
  end

  def comment_params
    params.require(:user_comment).permit(:person_name, :comment, :rating)
  end
end