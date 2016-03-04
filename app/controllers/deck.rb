#  List all our decks

get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

# get '/decks/:id' do
#   @deck = Deck.find(params[:id])
#   erb :'game/show'
# end

get '/decks/:id/play' do
  # until game_over?
  # @deck = Deck.find(params[:id])
  # @guesses= Guess.all
  # @cards = still_incorrect_cards

  erb :'game/show'
end

