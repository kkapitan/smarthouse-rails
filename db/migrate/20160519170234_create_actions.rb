class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :action_subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
