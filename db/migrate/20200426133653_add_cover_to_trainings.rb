class AddCoverToTrainings < ActiveRecord::Migration[5.2]
  def change
    add_column :trainings, :cover, :string
  end
end
