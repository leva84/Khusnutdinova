class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :photo, null: false
      t.string :shirt, null: false
      t.string :deck_name, null: false

      t.timestamps
    end
  end
end
