class ChangeDefaultAvailabilityForDrones < ActiveRecord::Migration[7.1]
  def change
    change_column :drones, :availability, :boolean, :default => true
  end
end
