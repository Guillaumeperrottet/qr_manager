class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :phone
      t.string :website
      t.string :category
      t.string :price_level
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
