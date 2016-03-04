class Card < ActiveRecord::Base
  validates :question, presence: true, uniqueness: true
  validates :answer, presence: true, uniqueness: true

  has_and_belongs_to_many :decks
  has_many :guesses
  has_many :games, through: :guesses
end
