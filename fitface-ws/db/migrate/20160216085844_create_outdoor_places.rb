class CreateOutdoorPlaces < ActiveRecord::Migration
  def change
    create_table :outdoor_places do |t|
      t.string :name
      t.string :address
      t.float :latitude, default: 0.0, precision: 8, scale: 2, null: false
      t.float :longitude, default: 0.0, precision: 8, scale: 2, null: false
      t.string :contact_number
      t.boolean :is_active, default: true
      t.timestamps
    end
  end
end
