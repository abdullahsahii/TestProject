  class CharactersController < ApplicationController

    def index
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
      @query = params[:q]
      @characters = Character.where('name LIKE ?', "%#{@query}%")
      render layout: false
    end

  end
