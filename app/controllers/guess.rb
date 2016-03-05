post '/guesses' do
  binding.pry
  guess = Guess.new(game_id: params[:game_id], card_id: params[:card_id])
  guess.save
  redirect "/games/#{params[:game_id]}"
end
