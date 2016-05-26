class CreateUserOutdoorPlaces < ActiveRecord::Migration
  def change
    create_table :user_outdoor_places do |t|
      t.belongs_to :user
      t.belongs_to :outdoor_place
      t.timestamps
    end
  end
end
