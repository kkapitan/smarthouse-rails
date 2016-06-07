class AddConfigurationToActionSubject < ActiveRecord::Migration
  def change
    add_column :action_subjects, :configuration, :string
  end
end
