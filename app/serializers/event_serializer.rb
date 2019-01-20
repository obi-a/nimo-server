class EventSerializer < ActiveModel::Serializer
  attributes :id,  :created_at

  belongs_to :transition

  def id
    object.uuid
  end
end
