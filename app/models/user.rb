class User < ApplicationRecord
  belongs_to :person

  has_many :groups, through: :user_groups
end
