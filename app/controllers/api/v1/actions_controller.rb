class Api::V1::ActionsController < ApplicationController
  before_action :authenticate_with_token!, :only => [:index, :create, :destroy]

  def index
    @actions = current_user.actions
    @action_types = Action.action_types

    render '/api/v1/actions/index.json.jbuilder'
  end

  def create
    @action = current_user.actions.new(action_params)
    if @action.save
      render :template =>"/api/v1/actions/create.json.jbuilder", :status => 201, :formats => [:json]
    else
      render :template =>"/api/v1/actions/errors.json.jbuilder", :status => 422, :formats => [:json]
    end
  end

  def destroy
    current_user.actions.find_by(params[:id]).destroy
    head 204
  end

  private
    def action_params
      params.permit(:action_subject_id, :action_type)
    end
end
