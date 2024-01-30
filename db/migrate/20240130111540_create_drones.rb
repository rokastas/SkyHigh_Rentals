class CreateDrones < ActiveRecord::Migration[7.1]
  def change
    create_table :drones do |t|
      t.float :price
      t.string :brand
      t.string :model
      t.integer :time_in_air
      t.text :description
      t.integer :weight
      t.string :category
      t.boolean :availability
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
