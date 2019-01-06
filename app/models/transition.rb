class Transition < ApplicationRecord
  include UUIDHelper

  after_initialize :set_uuid

  belongs_to :start, class_name: 'Status'
  belongs_to :end,   class_name: 'Status'

  has_many :workflow_transitions
  has_many :workflows, through: :workflow_transitions
end
