class CreateActionSubjects < ActiveRecord::Migration
  def change
    create_table :action_subjects do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
