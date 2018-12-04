class AddAddressLongitudeToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :address_longitude, :float
  end
end
