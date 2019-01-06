class Workflow < ApplicationRecord
  has_many :transitions, through: :workflow_transitions
end
