class Person < ApplicationRecord
  include UUIDHelper

  devise :database_authenticatable,
         :jwt_authenticatable

  after_initialize :set_uuid

  has_one :user

end
