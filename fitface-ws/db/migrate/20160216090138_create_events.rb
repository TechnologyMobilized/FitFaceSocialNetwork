class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.float :latitude, default: 0.0, precision: 8, scale: 2, null: false
      t.float :longitude, default: 0.0, precision: 8, scale: 2, null: false
      t.boolean :is_active, default: true
      t.timestamps
    end
  end
end
