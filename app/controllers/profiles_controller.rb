class ProfilesController < ApplicationController
  def index
    @users = User.all
  end
  
  def search
    @query = params[:q]
    @users = User.tagged_with(@query, on: :skills) & User.tagged_with(@query, on: :experiences)
    render layout: false
  end


end
