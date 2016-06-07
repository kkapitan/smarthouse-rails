class CreateActionTriggers < ActiveRecord::Migration
  def change
    create_table :action_triggers do |t|
      t.integer :weeks
      t.integer :hours
      t.integer :minutes

      t.integer :day_hour
      t.integer :start_hour
      t.integer :finish_hour

      t.text :week_days

      t.timestamps null: false
    end
  end
end
