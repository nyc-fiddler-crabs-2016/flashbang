post '/guesses' do
  card = Card.find(params[:card_id])
  status = card.guess_correct?(params[:guess])
  guess = Guess.create(game_id: params[:game_id], card_id: params[:card_id], status: status)
  game = Game.find(params[:game_id])
  session[:previous_guess] = guess

  if game.game_over?
    session[:previous_guess] = nil
    @game = Game.find(params[:game_id])
    erb :'games/_game_stats'
  else
    redirect "/games/#{params[:game_id]}"
  end
end
