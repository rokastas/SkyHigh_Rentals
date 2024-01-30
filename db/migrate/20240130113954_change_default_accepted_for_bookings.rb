class ChangeDefaultAcceptedForBookings < ActiveRecord::Migration[7.1]
  def change
    change_column :bookings, :accepted, :boolean, :default => false
  end
end
