class Card < ActiveRecord::Base
  validates :question, presence: true, uniqueness: true
  validates :answer, presence: true, uniqueness: true

  has_many :deck_cards
  has_many :decks, through: :deck_cards
  has_many :guesses
  has_many :games, through: :decks

  def guess_correct?(guess)
    guess.downcase.strip.chomp == self.answer.downcase.strip.chomp
  end

end
