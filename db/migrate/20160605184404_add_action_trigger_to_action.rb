class AddActionTriggerToAction < ActiveRecord::Migration
  def change
    add_reference :actions, :action_trigger, index: true, foreign_key: true
  end
end
