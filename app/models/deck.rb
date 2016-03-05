class Deck < ActiveRecord::Base
  validates :name, presence: true
  # validates :name, :uniqueness: {scope: :user, message:"You already made a deck with that name"}

  has_many :deck_cards
  has_many :cards, through: :deck_cards
  has_many :games
  has_many :users, through: :games

  def still_incorrect_cards
    guesses = Guess.where(status: false)
    Card.where()
  end

  def self.deck_over_five_minutes_old?
     (Time.now - Deck.last.created_at).seconds > 20
  end

  def self.destroy_empty_decks
      Deck.last.destroy
      # @error = "Can't get around trying to create an empty deck my man" %>
      # redirect '/'
  end
end
