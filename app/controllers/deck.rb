#  List all our decks

get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

# get '/decks/:id' do
#   @deck = Deck.find(params[:id])
#   erb :'game/show'
# end
