class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.integer :price
      t.references :user, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
