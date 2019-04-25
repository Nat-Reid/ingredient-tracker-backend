class Api::V1::User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: {case_sensitive: false}
end
