class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck

  has_many :guesses
  has_many :cards, through: :deck


  def grab_card
    self.cards.sample
  end

  def available_cards_collection
    true_guesses = self.guesses.where(status: true)
    unavailable_cards = []
    true_guesses.each do |guess|
       unavailable_cards << Card.find(guess.card_id)
    end
    self.cards - unavailable_cards
  end

  def game_over?
    available_cards_collection.empty?
  end



  def total_guesses
    self.guesses.count
  end

  def total_correct_guesses
    self.guesses.where(status: true).count
  end

  def correct_first_try
    array_of_card_ids = self.guesses.pluck(:card_id)
    array_of_card_ids.find_all { |x| array_of_card_ids.count(x) == 1 }
  end

  def amount_correct_on_first_try
    correct_first_try.length
  end

end
