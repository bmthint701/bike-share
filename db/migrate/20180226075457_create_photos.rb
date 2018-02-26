class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.references :listing, foreign_key: true
      t.string :photo_url

      t.timestamps
    end
  end
end
