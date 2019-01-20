class Group < ApplicationRecord
  include UUIDHelper

  after_initialize :set_uuid

  has_many :user_groups
  has_many :users,    through: :user_groups
  has_many :projects, through: :project_groups

  belongs_to :owner, class_name: 'User'
end
