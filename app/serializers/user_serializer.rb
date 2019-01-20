class UserSerializer < ActiveModel::Serializer
  attributes :id

  has_many :groups, serializer: GroupSerializer, key: :groups

  def id
    object.uuid
  end
end
