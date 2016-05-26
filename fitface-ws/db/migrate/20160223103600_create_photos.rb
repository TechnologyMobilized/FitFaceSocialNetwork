class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.boolean :is_profile, default: false
      t.timestamps
    end
  end
end
