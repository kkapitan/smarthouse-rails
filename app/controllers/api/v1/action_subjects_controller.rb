class Api::V1::ActionSubjectsController < ApplicationController

  def index
    @subjects = ActionSubject.all

    render "/api/v1/action_subjects/index.json.jbuilder"
  end

  def manipulate_simple_subject

    action = Action.find_by(params[:id])
    @action_subject = action.action_subject
    pin = @action_subject.configuration
    state = params[:state]


    if (@action_subject.state == state)
    else
      system('python', '/simpleSubject.py', pin, state)
      @action_subject.update_attributes state: state
    end

    render "api/v1/action_subjects/manipulate_simple_subject_result.json.jbuilder"

  end

end