class AddStateToActionSubject < ActiveRecord::Migration
  def change
    add_column :action_subjects, :state, :integer, default: 0, null: false
  end
end
