require 'httparty'
class GetApiData
  def self.get_data()
    response = HTTParty.get('https://rickandmortyapi.com/api/character')
    characters_data = JSON.parse(response.body)
    user = User.find(1)
    characters_data["results"].each do |character_data|
      user.characters.find_or_create_by(name: character_data["name"], species: character_data["species"], status: character_data["status"], gender: character_data["gender"], origin_url: character_data["origin"]["url"], origin_name: character_data["origin"]["name"], location_name: character_data["location"]["name"], location_url: character_data["location"]["url"], image: character_data["image"], created: character_data["created"])
    end
  end
end