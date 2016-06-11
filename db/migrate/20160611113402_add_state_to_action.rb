class AddStateToAction < ActiveRecord::Migration
  def change
    add_column :actions, :state, :integer, default: 0, null: false
  end
end
