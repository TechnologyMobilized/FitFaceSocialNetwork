class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.belongs_to :user
      t.belongs_to :gym
      t.timestamps
    end
  end
end
