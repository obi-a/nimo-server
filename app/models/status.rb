class Status < ApplicationRecord
  include UUIDHelper

  after_initialize :set_uuid
end
