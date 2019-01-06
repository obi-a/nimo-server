class Project < ApplicationRecord
  has_many :groups, through: :project_groups
end
