class TicketSerializer < ActiveModel::Serializer
  attributes :id, :summary, :description

  belongs_to :creator, serializer: UserSerializer
  belongs_to :assignee, serializer: UserSerializer
  belongs_to :workflow
  belongs_to :project

  has_many   :events

  def id
    object.uuid
  end
end
