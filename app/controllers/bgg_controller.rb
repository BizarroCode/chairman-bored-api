class BggController < ApplicationController
  include HTTParty 

  base_uri 'boardgamegeek.com/xmlapi2'

  def search
    response = self.class.get("/search?query=#{params[:query]}&type=boardgame")
    render json: Hash.from_xml(response.body).to_json
  end
end
