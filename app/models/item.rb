require 'open-uri'
class Item < ApplicationRecord
  before_validation :geocode_address

  def geocode_address
    if self.address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_uploader :photo, PhotoUploader

  # Direct associations

  belongs_to :item_type

  belongs_to :status

  belongs_to :location

  has_many   :bookmarks,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  has_many   :transactions,
             :dependent => :destroy

  belongs_to :poster,
             :class_name => "User",
             :foreign_key => "seller_id"

  # Indirect associations

  # Validations

end
