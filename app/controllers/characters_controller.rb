class CharactersController < ApplicationController

  def index
    # dataa = GetApiData.new()
    # dataa.get_data(current_user)
    if user_signed_in?
      @characters = current_user.characters.page(params[:page])
    else
      @characters = Character.page(params[:page])
    end
  end

  def show
    @character = Character.find(params[:id])
  end

  def search
    @selected_category = params[:category]
    @query = params[:q]
    if @selected_category == "Name"
      @characters = Character.where('name LIKE ?', "%#{@query}%")
    elsif @selected_category == "Gender"
      @characters = Character.where('gender LIKE ?', "#{@query}")
    elsif @selected_category == "Skills"
      @users = User.tagged_with(@query, on: :skills)
    elsif @selected_category == "Experience"
      @users = User.tagged_with(@query, on: :experiences)
    elsif @selected_category = "Skills&Experience"
      @users = User.tagged_with(@query, on: :skills) & User.tagged_with(@query, on: :experiences)
    end
    
    render layout: false
  end
end
