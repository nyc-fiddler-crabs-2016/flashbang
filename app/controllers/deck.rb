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


get '/decks/:id' do
  @deck = Deck.find(params[:id])
  erb :'decks/show'
end


get '/decks/:id/edit' do
  @deck = Deck.find(params[:id])
  # if logged_in? && current_user.id == @deck.user_id
    erb :'decks/edit'
  # # else
  #   status 403
  #   redirect
  # end
end


put '/decks/:id' do
  @deck = Deck.find(params[:id])
 # if logged_in? && current_user.id == @deck.user_id
#   # erb :'decks/show'
# end
  @deck.update(name: params[:name])
  erb :'/cards/new'
end


# delete '/decks/:id' do
#  deck = Deck.find(params[:id])
#   # if logged_in? && current_user.id == @deck.user_id
#     deck.destroy
#     redirect '/'
#   # else
#   #   status 403
#   #   redirect
#   # end
# end










