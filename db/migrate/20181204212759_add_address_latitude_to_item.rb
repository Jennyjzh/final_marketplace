class AddAddressLatitudeToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :address_latitude, :float
  end
end
