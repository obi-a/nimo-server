class PersonSerializer < ActiveModel::Serializer
  attributes :id, :email, :firstname, :lastname, :created_at, :updated_at

  has_one :user

  def id
    object.uuid
  end
end
