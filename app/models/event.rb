class Event < ApplicationRecord
  belongs_to :transition
  belongs_to :status
end
