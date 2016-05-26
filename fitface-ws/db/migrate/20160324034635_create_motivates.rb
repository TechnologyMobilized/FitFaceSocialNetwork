class CreateMotivates < ActiveRecord::Migration
  def change
    create_table :motivates do |t|
      t.belongs_to :user
      t.string :url
      t.boolean :is_video, default: false
      t.timestamps
    end
  end
end
