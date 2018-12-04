class Item < ApplicationRecord
  # Direct associations

  has_many   :transactions,
             :dependent => :destroy

  belongs_to :poster,
             :class_name => "User",
             :foreign_key => "seller_id"

  # Indirect associations

  # Validations

end
