class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :address
      t.string :bike_type
      t.references :user, foreign_key: true
      t.boolean :active
      t.text :instruction
      t.integer :hourly_price
      t.string :listing_name
      t.text :description

      t.timestamps
    end
  end
end
