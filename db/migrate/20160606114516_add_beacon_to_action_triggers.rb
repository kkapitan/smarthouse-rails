class AddBeaconToActionTriggers < ActiveRecord::Migration
  def change
    add_reference :action_triggers, :beacon, index: true, foreign_key: true
  end
end
