class WorkflowSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at

  has_many :transitions

  def id
    object.uuid
  end
end
