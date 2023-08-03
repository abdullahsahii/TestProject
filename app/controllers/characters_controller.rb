require 'httparty'
class CharactersController < ApplicationController
  before_action :set_character, only: [:show]
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
  def index
    GetApiData.get_data(current_user)
    @characters = Character.all.page(params[:page])
  end
  def show
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @character.update(character_params)
      redirect_to @character
    else
      render :edit
    end
  end

  def destroy
    @character.destroy
    redirect_to root_path
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :status, :species, :type, :gender, :origin_name, :origin_url, :location_name, :location_url, :image, :created)
  end

  def require_admin
    unless current_user&.admin?
      flash[:alert] = 'You do not have permission to perform this action.'
      redirect_to root_path
    end
  end
end
