class CreateDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :descriptions do |t|
      t.string :picture
      t.text :text
      t.string :title

      t.timestamps
    end
  end
end
