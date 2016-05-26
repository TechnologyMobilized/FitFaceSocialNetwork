class CreateUserSports < ActiveRecord::Migration
  def change
    create_table :user_sports do |t|
      t.belongs_to :user
      t.belongs_to :sport
      t.timestamps
    end
  end
end
