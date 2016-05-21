class Api::V1::ActionsController < ApplicationController
  before_action :authenticate_with_token!, :only => [:index]

  def index
    @actions = Action.where(user_id: current_user.id)
    print @actions.first.action_subject
    render '/api/v1/actions/index.json.jbuilder'
  end
end
