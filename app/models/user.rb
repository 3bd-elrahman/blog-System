class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email

  has_many :articles , dependent: :delete_all
  has_many :comments , dependent: :delete_all
  has_one_attached :image

  

end
