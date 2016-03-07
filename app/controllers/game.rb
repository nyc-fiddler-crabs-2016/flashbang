
#  Create a new game

post '/games' do
  if !logged_in?
    @error = "must be logged in to play a game"
    @decks = Deck.all
    erb :"/decks/index"
  else

    session[:previous_guess] = nil
    @game = Game.create(user_id: session[:user_id], deck_id: params[:deck_id])
      if @game.cards.empty?
        if @game.deck
          @game.deck.destroy
        end
      @game.destroy
      @error = "You can't play a game with an empty deck yo"
      erb :'/index'
    else
      redirect "/games/#{@game.id}"
    end
  end
end

get '/games/:id' do
  @game = Game.find(params[:id])
  @card = @game.available_cards_collection.sample

  @previous_guess = session[:previous_guess]
  erb :'/games/show'

end
