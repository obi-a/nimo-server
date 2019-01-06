class Person < ApplicationRecord
  include UUIDHelper

  after_initialize :set_uuid

  has_one :user

end
