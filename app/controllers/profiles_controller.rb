class ProfilesController < ApplicationController
  def index
    @users = User.all
    # @skill = params[:skill]
    # if (@skill.present?)
    #   @users = User.tagged_with(params[:skill])
    # end
  end

  def show

  end

  def edit

  end
  def search
    @query = params[:q]
    @users = User.tagged_with(@query, on: :skills) & User.tagged_with(@query, on: :experiences)
    render layout: false
  end


end
