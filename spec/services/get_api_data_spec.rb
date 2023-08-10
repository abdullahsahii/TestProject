require 'rails_helper'
require 'httparty'

RSpec.describe GetApiData, type: :class do
  describe '.get_data' do
    let(:arge) { double('arge') }
    let(:character_data) do
      [
        {
          'name' => 'Character 1',
          'species' => 'Human',
          'status' => 'Alive',
          'gender' => 'Male',
          'origin' => { 'url' => 'origin_url_1', 'name' => 'Origin 1' },
          'location' => { 'url' => 'location_url_1', 'name' => 'Location 1' },
          'image' => 'image_url_1',
          'created' => 'created_date_1'
        },
        {
          'name' => 'Character 2',
          'species' => 'Alien',
          'status' => 'Dead',
          'gender' => 'Female',
          'origin' => { 'url' => 'origin_url_2', 'name' => 'Origin 2' },
          'location' => { 'url' => 'location_url_2', 'name' => 'Location 2' },
          'image' => 'image_url_2',
          'created' => 'created_date_2'
        }
      ]
    end
    let(:response) { double('response', body: { 'results' => character_data }.to_json) }

    before do
      allow(HTTParty).to receive(:get).and_return(response)
      allow(arge).to receive(:characters).and_return(arge)
    end

    it 'fetches data from the API and creates characters' do
      expect(HTTParty).to receive(:get).with('https://rickandmortyapi.com/api/character').and_return(response)

      expect(arge).to receive(:create).with(
        name: 'Character 1',
        species: 'Human',
        status: 'Alive',
        gender: 'Male',
        origin_url: 'origin_url_1',
        origin_name: 'Origin 1',
        location_name: 'Location 1',
        location_url: 'location_url_1',
        image: 'image_url_1',
        created: 'created_date_1'
      )
      expect(arge).to receive(:create).with(
        name: 'Character 2',
        species: 'Alien',
        status: 'Dead',
        gender: 'Female',
        origin_url: 'origin_url_2',
        origin_name: 'Origin 2',
        location_name: 'Location 2',
        location_url: 'location_url_2',
        image: 'image_url_2',
        created: 'created_date_2'
      )

      GetApiData.get_data(arge)
    end
  end
end
