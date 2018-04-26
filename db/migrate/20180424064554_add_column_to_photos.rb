class AddColumnToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :folder_id, :integer
  end
end
