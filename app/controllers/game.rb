
#  Create a new game

post '/games' do
  session[:previous_guess] = nil
  @game = Game.create(user_id: session[:user_id], deck_id: params[:deck_id])
  redirect "/games/#{@game.id}"
end

get '/games/:id' do
  @game = Game.find(params[:id])
  @card = @game.available_cards_collection.sample

  @previous_guess = session[:previous_guess]
  erb :'/games/show'

end
