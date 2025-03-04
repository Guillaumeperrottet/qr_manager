class CreateQrCodes < ActiveRecord::Migration[7.1]
  def change
    create_table :qr_codes do |t|
      t.string :title
      t.string :url
      t.text :description
      t.integer :visits_count
      t.boolean :active
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
