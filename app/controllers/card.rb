post '/cards' do
  if logged_in?
    @deck = Deck.find(params[:deck_id])
    @card = Card.new(params[:card])
    if @card.save
      @deck.cards << @card
      erb :'/cards/new'
    elsif @deck.cards.empty?
      @error = "You need to add at least one card"
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
