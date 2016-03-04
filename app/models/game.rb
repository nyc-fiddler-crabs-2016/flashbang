class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck

  has_many :guesses
  has_many :cards, through: :guesses

  # def total_guesses
  #   self.guesses.count
  # end

end
