class Workflow < ApplicationRecord
  include UUIDHelper

  after_initialize :set_uuid

  has_many :workflow_transitions
  has_many :transitions, through: :workflow_transitions
end
