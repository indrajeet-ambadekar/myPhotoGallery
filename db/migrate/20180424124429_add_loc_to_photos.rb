class AddLocToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :lat, :float
    add_column :photos, :lng, :float
  end
end
