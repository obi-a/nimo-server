class User < ApplicationRecord
  include UUIDHelper

  after_initialize :set_uuid

  belongs_to :person

  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :tickets, foreign_key: :assignee
end
