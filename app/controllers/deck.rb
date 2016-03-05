#  List all our decks

get '/' do
  @decks = Deck.all
  erb :'decks/index'
end

get '/decks/new' do
  if logged_in?
    erb :'decks/new'
  else
    @error = "You do not have access"
    erb :'/login'
  end
end

post '/decks' do
  if logged_in?
    @deck = Deck.new(name: params[:name])
    if @deck.save
    erb :'/cards/new'
    else
      @errors = @deck.errors.full_messages
      erb :'decks/new'
    end
  else
    @no_access = "You do not have access"
    erb :'/login'
  end
end


# get '/decks/:id' do
#   @deck = Deck.find(params[:id])
#   erb :'game/show'
# end
