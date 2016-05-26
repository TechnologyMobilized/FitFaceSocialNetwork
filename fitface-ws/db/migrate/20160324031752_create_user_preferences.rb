class CreateUserPreferences < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.belongs_to :user
      t.integer :turn_on_day
      t.timestamps
    end
  end
end
