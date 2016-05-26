class CreateUserGyms < ActiveRecord::Migration
  def change
    create_table :user_gyms do |t|
      t.belongs_to :user
      t.belongs_to :gym
      t.timestamps
    end
  end
end
