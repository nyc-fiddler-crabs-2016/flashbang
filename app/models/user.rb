class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :games
  has_many :decks, through: :games
  # has_many :guesses, through :games # all time stats
end
