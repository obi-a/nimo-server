class Ticket < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User'
  belongs_to :workflow
end
