class RemoveMainFromPhotos < ActiveRecord::Migration[5.2]
  def change
    remove_column :photos, :main, :boolean
  end
end
