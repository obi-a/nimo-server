class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update]

  def create
    @project = Project.create!(project_params)
    json_response(@project, :created)
  end

  def show
    json_response(@project)
  end

  private

  def project_params
    # whitelist params
    params.permit(:name, :description)
  end

  def set_project
    @project = Project.find_by_uuid!(params[:id])
  end
end
