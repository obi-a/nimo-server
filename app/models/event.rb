class Event < ApplicationRecord
  include UUIDHelper

  after_initialize :set_uuid

  belongs_to :transition
  belongs_to :status
  belongs_to :ticket
end
