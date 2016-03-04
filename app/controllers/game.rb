
#  Create a new game

post '/games' do
  @game = Game.create(user_id: session[:user_id], deck_id: params[:deck_id])

end


