class Category < ApplicationRecord
  # Direct associations

  has_many   :items,
             :foreign_key => "item_type_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
