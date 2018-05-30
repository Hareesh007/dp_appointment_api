class User < ApplicationRecord
  #attributes validation
  validates_presence_of :name, :email, :password_digest
  # email uniqness check validation.
  validates :email,  uniqueness: true

  has_secure_password
end
