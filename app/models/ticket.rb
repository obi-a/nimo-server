class Ticket < ApplicationRecord
  belongs_to :creator,  class_name: 'User'
  belongs_to :assignee, class_name: 'User'
  belongs_to :workflow
  belongs_to :project

  delegate :project, to: :project_ticket, allow_nil: true
end
