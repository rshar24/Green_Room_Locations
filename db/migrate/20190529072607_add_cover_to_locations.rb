class AddCoverToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :cover, :string
  end
end
