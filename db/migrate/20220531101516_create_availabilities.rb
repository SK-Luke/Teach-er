class CreateAvailabilities < ActiveRecord::Migration[6.1]
  def change
    create_table :availabilities do |t|
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.boolean :blocker, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
