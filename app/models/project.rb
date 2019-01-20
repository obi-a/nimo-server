class Project < ApplicationRecord
  include UUIDHelper

  after_initialize :set_uuid

  has_many :project_groups
  has_many :groups, through: :project_groups


  has_many :tickets

  belongs_to :owner, class_name: 'User'
end
