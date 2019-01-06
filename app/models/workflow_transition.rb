class WorkflowTransition < ApplicationRecord
  belongs_to :transition
  belongs_to :workflow
end
