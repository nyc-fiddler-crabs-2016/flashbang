class User < ActiveRecord::Base
  validates :username, presense: true, uniqueness: true
  validates :email, presense: true, uniqueness: true

  has_many :games
  has_many :decks, through :games
  # has_many :guesses, through :games # all time stats
end
