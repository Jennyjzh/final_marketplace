class Transaction < ApplicationRecord
  # Direct associations

  belongs_to :buyer,
             :class_name => "User"

  # Indirect associations

  # Validations

end
