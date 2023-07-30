require 'httparty'

class CharactersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    # response = HTTParty.get('https://rickandmortyapi.com/api/character')
    # characters_data = JSON.parse(response.body)

    # characters_data["results"].each do |character_data|
    #   current_user.characters.create(name: character_data["name"], species: character_data["species"], status: character_data["status"], gender: character_data["gender"], origin_url: character_data["origin"]["url"], origin_name: character_data["origin"]["name"], location_name: character_data["location"]["name"], location_url: character_data["location"]["url"], image: character_data["image"], created: character_data["created"])
    # end
    #
    @response = GetApiData.get_data(current_user)
    page_number = params[:page_number]
    @characters = Character.paginate(page: page_number, per_page: 10)



  end

  # private
  #
  # def api_params
  #   params.require(:api).permit(:name, :status, :species, :type, :gender, :origin_name, :origin_url, :location_name, :location_url, :image, :created)
  # end

end
