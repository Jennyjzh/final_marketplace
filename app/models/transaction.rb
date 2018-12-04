class Transaction < ApplicationRecord
  # Direct associations

  belongs_to :seller,
             :class_name => "User"

  belongs_to :buyer,
             :class_name => "User"

  # Indirect associations

  # Validations

end
