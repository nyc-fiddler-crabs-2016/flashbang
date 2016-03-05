
#  Create a new game

post '/games' do
  @game = Game.create(user_id: session[:user_id], deck_id: params[:deck_id])
  redirect "/games/#{@game.id}"
end

get '/games/:id' do
  @game = Game.find(params[:id])
  binding.pry
  @card = @game.available_cards_collection.sample
  erb :'/games/show'

  # @guesses= Guess.where(game_id: @game.id)
  # @cards = still_incorrect_cards

end


# get '/games/:id' do
#   if game_over?
#     # redirect'/games/ stats page'
#   else
#     @game = Game.find(params[:id])
#     @guesses= Guess.where(game_id: @game.id)
#     @cards = still_incorrect_cards
#     erb :'/games/show'
#   end
# end


