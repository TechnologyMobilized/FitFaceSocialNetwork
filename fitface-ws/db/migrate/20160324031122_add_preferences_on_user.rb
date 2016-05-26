class AddPreferencesOnUser < ActiveRecord::Migration
  def up
    add_column :users, :turn_on_start, :string
    add_column :users, :turn_on_end, :string
  end

  def down
    remove_column :users, :turn_on_start
    remove_column :users, :turn_on_end
  end
end
