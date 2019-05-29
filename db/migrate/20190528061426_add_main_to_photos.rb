class AddMainToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :main, :boolean
  end
end
