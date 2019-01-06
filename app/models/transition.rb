class Transition < ApplicationRecord
  belongs_to :start, class_name: 'Status'
  belongs_to :end,   class_name: 'Status'

  has_many :workflows, through: :workflow_transitions
end
