class CreateTrainingSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :training_subscriptions do |t|
      t.string :user_name
      t.string :user_email
      t.references :training, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
