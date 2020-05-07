class CreateAlignments < ActiveRecord::Migration[5.2]
  def change
    create_table :alignments do |t|
      t.string :title
      t.text :rule
      t.integer :quantity
      t.string :deck_name

      t.timestamps
    end
  end
end
