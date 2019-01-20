class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :owner_id

  has_many :tickets

  def id
    object.uuid
  end

  def owner_id
    object.owner&.uuid
  end
end
