class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  # Returns all games in db
  get '/games' do
    games = Game.all.order(:title).limit(10)
    games.to_json
  end

  # Returns specific game by id
  get '/games/:id' do
   game = Game.find(params[:id])

   # Add include method to include data about associated models in our json 
   game.to_json(include: :reviews)
   game.to_json(include: {reviews: {include: :user }})
  end

end
