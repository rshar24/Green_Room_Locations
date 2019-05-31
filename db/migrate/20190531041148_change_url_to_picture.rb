class ChangeUrlToPicture < ActiveRecord::Migration[5.2]
  def change
    rename_column :photos, :url, :picture
  end
end
