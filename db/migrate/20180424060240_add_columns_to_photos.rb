class AddColumnsToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :file_type, :string
    add_column :photos, :file_size, :double
  end
end
