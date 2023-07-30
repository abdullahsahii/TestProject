require 'httparty'
class CharactersController < ApplicationController
  def index
    GetApiData.get_data
    page_number = params[:page_number] 
    @characters = Character.paginate(page: page_number, per_page: 10)
  end

  # private
  #
  # def api_params
  #   params.require(:api).permit(:name, :status, :species, :type, :gender, :origin_name, :origin_url, :location_name, :location_url, :image, :created)
  # end

end
