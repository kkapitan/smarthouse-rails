class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.string :name
      t.integer :major

      t.timestamps null: false
    end
  end
end
