post '/guesses' do
  card = Card.find(params[:card_id])
  status = card.guess_correct?(params[:guess])
  guess = Guess.create(game_id: params[:game_id], card_id: params[:card_id], status: status)
  game = Game.find(params[:game_id])
  if game.game_over?
    redirect '/'
  else
    redirect "/games/#{params[:game_id]}"
  end
end
