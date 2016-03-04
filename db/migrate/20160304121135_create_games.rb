class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :deck, null: false
      t.references :user, null: false

      t.timestamps null: false
    end
  end
end
