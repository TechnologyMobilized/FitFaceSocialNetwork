class AddNewColumnsInUser < ActiveRecord::Migration
  def up
    add_column :users, :radius, :integer, default: 0
    add_column :users, :latitude, :float, default: 0, precision: 8, scale: 2, null: false
    add_column :users, :longitude, :float, default: 0, precision: 8, scale: 2, null: false
  end

  def down
    remove_column :users, :radius
    remove_column :users, :latitude
    remove_column :users, :longitude
  end
end
