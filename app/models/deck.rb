class Deck < ActiveRecord::Base
  validates :name, presence: true

  has_many :deck_cards
  has_many :cards, through: :deck_cards
  has_many :games
  has_many :users, through: :games

end
