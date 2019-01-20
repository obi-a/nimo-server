class GroupSerializer < ActiveModel::Serializer
  attributes :id, :owner_id, :name, :description, :created_at, :updated_at

  def owner_id
    object.owner.uuid
  end

  def id
    object.uuid
  end
end
