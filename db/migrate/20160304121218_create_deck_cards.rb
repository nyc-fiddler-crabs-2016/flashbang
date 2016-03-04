class CreateDeckCards < ActiveRecord::Migration
  def change
    t.references :deck
    t.references :card

    t.timestamps null: false
  end
end
