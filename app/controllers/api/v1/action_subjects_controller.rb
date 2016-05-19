class Api::V1::ActionSubjectsController < ApplicationController

  def index
    @subjects = ActionSubject.all

    render "/api/v1/action_subjects/index.json.jbuilder"
  end

end