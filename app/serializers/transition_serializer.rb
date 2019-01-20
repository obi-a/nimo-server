class TransitionSerializer < ActiveModel::Serializer
  attributes :id, :start, :end

  def id
    object.uuid
  end

  def start
    object.start.name
  end

  def end
    object.end.name
  end
end
