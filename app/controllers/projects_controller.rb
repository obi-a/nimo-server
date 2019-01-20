class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update]

  class ProjectOwnerNotFound; end

  def create
    owner = User.find_by_uuid(project_params[:owner_id])

    raise ProjectOwnerNotFound unless owner.present?

    @project = Project.create!(
      name:        project_params[:name],
      description: project_params[:description],
      owner:       owner
    )

    @project.groups << owner.default_group

    json_response(
      @project,
      status: :created
    )
  end

  def show
    json_response(
      @project,
      include: 'tickets'
    )
  end

  private

  def project_params
    # whitelist params
    params.permit(:name, :description, :owner_id)
  end

  def set_project
    @project = Project.find_by_uuid!(params[:id])
  end
end
