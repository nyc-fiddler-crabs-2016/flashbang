post '/cards' do
  if logged_in?
    @deck = Deck.find(params[:id])
    @card = Card.new(params[:card])
    if @card.save
      @deck.cards << @card
      erb :'/cards/new'
    else
      @errors = @card.errors.full_messages
      erb :'/cards/new'
    end
  else
    @no_access = "You do not have access"
    erb :'/login'
  end
end
