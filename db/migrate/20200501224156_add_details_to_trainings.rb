class AddDetailsToTrainings < ActiveRecord::Migration[5.2]
  def change
    add_column :trainings, :address, :string
    add_column :trainings, :start_time, :datetime
    add_column :trainings, :finish_time, :datetime
    add_column :trainings, :cost, :integer
  end
end
