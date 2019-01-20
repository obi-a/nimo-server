class Ticket < ApplicationRecord
  include UUIDHelper

  after_initialize :set_uuid

  belongs_to :creator,  class_name: 'User'
  belongs_to :assignee, class_name: 'User'
  belongs_to :workflow
  belongs_to :project

  has_many   :events
end
