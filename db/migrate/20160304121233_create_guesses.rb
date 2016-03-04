class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.references :game, null: false
      t.references :card, null: false
      t.boolean :status, default: false

      t.timestamps null: false
    end
  end
end
