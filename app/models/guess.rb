class Guess < ActiveRecord::Base
  belongs_to :game
  belongs_to :card


  def correct?
    if self.status
      'Correct!'
    else
      'Incorrect...'
    end
  end

end
