class AddPhotoColumnToListing < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :photo, :string
  end
end
