class User < ApplicationRecord
  include UUIDHelper
  include UserHelper

  after_initialize :set_uuid, :set_default_user_group

  belongs_to :person

  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :tickets, foreign_key: :assignee

  def default_group
    groups.where(owner: self).first
  end
end
