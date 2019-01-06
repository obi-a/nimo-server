class Group < ApplicationRecord
  has_many :users,    through: :user_groups
  has_many :projects, through: :project_groups
end
