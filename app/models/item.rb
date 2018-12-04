class Item < ApplicationRecord
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
