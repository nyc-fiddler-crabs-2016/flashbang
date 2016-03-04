class Deck < ActiveRecord::Base
  # validates :name

  has_and_belongs_to_many :cards
  has_many :games
  has_many :users, through: :games
end
