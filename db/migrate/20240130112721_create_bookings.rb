class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.datetime :from_date
      t.datetime :to_date
      t.boolean :accepted
      t.references :user, null: false, foreign_key: true
      t.references :drone, null: false, foreign_key: true

      t.timestamps
    end
  end
end
