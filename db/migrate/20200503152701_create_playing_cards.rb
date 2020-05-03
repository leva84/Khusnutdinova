class CreatePlayingCards < ActiveRecord::Migration[5.2]
  def change
    create_table :playing_cards do |t|
      t.references :game, index: true, foreign_key: true
      t.references :card, index: true, foreign_key: true, null: false

      t.text :answer

      t.timestamps
    end
  end
end
