class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck

  has_many :guesses
  has_many :cards, through: :deck

  def total_guesses
    self.guesses.count
  end

   def total_correct_guesses
    self.guesses.where(status: true).count
  end

  def self.game_over?
    total_correct_guesses == self.cards.count
  end

  # def play_game

  # end

  def correct_first_try
    #Guesses where(status:true) && Guess.card_id
  end

end
