class AddTriggerTypeToActionTriggers < ActiveRecord::Migration
  def change
    add_column :action_triggers, :trigger_type, :integer, default: 0, null: false
  end
end
