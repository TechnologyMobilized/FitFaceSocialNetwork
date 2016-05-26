class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.belongs_to :user
      t.integer :report_id
      t.boolean :is_report, default: false
      t.timestamps
    end
  end
end
