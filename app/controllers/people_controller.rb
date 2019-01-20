class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :update]

  def create
    @person = Person.create!(person_params)
    @person.create_user!
    json_response(
      @person,
      include: {user: :groups},
      status: :created
    )
  end

  def show
    json_response(
      @person,
      include: {user: :groups}
    )
  end

  def update
    @person.update(person_params)
    head :no_content
  end

  private

  def person_params
    # whitelist params
    params.permit(:email, :firstname, :lastname)
  end

  def set_person
    @person = Person.find_by_uuid!(params[:id])
  end
end
