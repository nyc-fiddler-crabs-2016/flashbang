class CreateDeckCards < ActiveRecord::Migration
  def change
    create_table :deck_cards do |t|
      t.references :deck
      t.references :card

      t.timestamps null: false
    end
  end
end

