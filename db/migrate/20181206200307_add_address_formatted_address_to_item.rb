class AddAddressFormattedAddressToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :address_formatted_address, :string
  end
end
