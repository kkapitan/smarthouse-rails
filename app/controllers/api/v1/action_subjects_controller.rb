class Api::V1::ActionSubjectsController < ApplicationController

  def index
    @subjects = ActionSubject.all

    render "/api/v1/action_subjects/index.json.jbuilder"
  end

  def manipulate_simple_subject

    @action_subject = ActionSubject.find_by(params[:id])
    pin = @action_subject.configuration
    state = params[:state]


    if (ActionSubject.states[@action_subject.state] == state.to_i)
      head 422
    else
      system('python', '/simpleSubject.py', pin, state)
      @action_subject.update_attributes state: ActionSubject.states.to_a[state.to_i].first

      render "api/v1/action_subjects/manipulate_simple_subject_result.json.jbuilder"
    end
  end

end