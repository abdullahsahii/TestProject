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
    @users = User.tagged_with(@query, on: :skills)
    render layout: false
  end


end
