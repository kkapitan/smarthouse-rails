class Api::V1::ActionsController < ApplicationController
  include Api::V1::ActionsHelper
  before_action :authenticate_with_token!, :only => [:index, :create, :destroy]

  def index
    @actions = current_user.actions
    @action_types = Action.action_types
    @beacons = Beacon.all

    render '/api/v1/actions/index.json.jbuilder'
  end

  def create
    new_trigger_params = trigger_params
    new_trigger_params[:trigger_type] = ActionTrigger.trigger_types.to_a[trigger_params[:trigger_type].to_i].first

    @trigger = ActionTrigger.new(new_trigger_params)
    if not @trigger.save
      print @trigger.errors.as_json
      render :template =>"/api/v1/trigger/errors.json.jbuilder", :status => 422, :formats => [:json]
      return
    end
    @trigger.reload

    @action = current_user.actions.new(action_params)
    @action.action_trigger_id = @trigger.id

    if @action.save
      print @action.action_type
      if @action.timer?
        add_cron_task(@trigger, @action)
      end
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
      params.permit(:action_subject_id, :action_type, :state)
    end

    def trigger_params
      params.require(:trigger).permit(:trigger_type, :weeks, :day_hour, :beacon_id, :start_hour, :finish_hour, :hours, :minutes, week_days: [])
    end
end
