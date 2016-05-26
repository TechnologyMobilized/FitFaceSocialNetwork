class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.belongs_to :user
      t.string :achieve
      t.string :event
      t.timestamps
    end
  end
end
