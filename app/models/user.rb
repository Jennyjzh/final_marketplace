class User < ApplicationRecord
  # Direct associations

  has_many   :purchases,
             :class_name => "Transaction",
             :foreign_key => "buyer_id",
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  has_many   :bookmarks,
             :dependent => :destroy

  has_many   :items,
             :foreign_key => "seller_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
