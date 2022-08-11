class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.integer :players_min
      t.integer :players_max
      t.integer :playtime
      t.integer :playtime_multiplier, default: 1
      t.boolean :coop

      t.timestamps
    end
  end
end
