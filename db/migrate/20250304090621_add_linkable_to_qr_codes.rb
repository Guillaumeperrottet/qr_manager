class AddLinkableToQrCodes < ActiveRecord::Migration[7.1]
  def change
    add_column :qr_codes, :linkable_type, :string
    add_column :qr_codes, :linkable_id, :integer
  end
end
