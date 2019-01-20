class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :update, :transition]

  class TicketProjectNotFound; end
  class TicketCreatorNotFound; end
  class NewTransitionNotFound; end

  WORKFLOW = Workflow.first.freeze # use the workflow from the database seed
  PENDING_STATUS = Status.find_by_name('Pending')

  def create

    creator = User.find_by_uuid(ticket_params[:creator_id])

    project = Project.find_by_uuid(ticket_params[:project_id])

    raise TicketCreatorNotFound unless creator.present?
    raise TicketProjectNotFound unless project.present?

    Ticket.transaction do
      @ticket = Ticket.create!(
        summary:     ticket_params[:summary],
        description: ticket_params[:description],
        creator:     creator,
        assignee:    creator,
        project:     project,
        workflow:    WORKFLOW
      )

      first_transition = Transition.where(start: PENDING_STATUS).first
      @ticket.events.create!(
        transition: first_transition,
        status:     first_transition.end
      )
    end

    json_response(
      @ticket,
      status: :created
    )
  end

  def show
    json_response(
      @ticket,
      include: [:creator, :assignee, :project, events: :transition, workflow: :transitions]
    )
  end

  def transition
    new_transition = Transition.find_by_uuid(ticket_params[:transition_id])

    raise NewTransitionNotFound unless new_transition.present?

    @ticket.events.create!(
      transition: new_transition,
      status:     new_transition.end
    )

    json_response(
      @ticket,
      include: [:creator, :assignee, :project, events: :transition, workflow: :transitions]
    )
  end

  def update
    @ticket.update(update_params)
    head :no_content
  end

  private

  def ticket_params
    # whitelist params
    params.permit(:summary, :description, :creator_id, :project_id, :transition_id)
  end

  def update_params
    params.permit(:summary, :description)
  end

  def set_ticket
    @ticket = Ticket.includes(:creator, :assignee, :project, events: :transition, workflow: :transitions)
      .find_by_uuid!(params[:id])
  end
end
