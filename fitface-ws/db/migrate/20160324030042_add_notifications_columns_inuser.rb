class AddNotificationsColumnsInuser < ActiveRecord::Migration
  def up
    add_column :users, :notify_via_app, :boolean, default: true
    add_column :users, :notify_via_sms, :boolean, default: false
    add_column :users, :notify_via_email, :boolean, default: false
    add_column :users, :turn_off_time, :integer
  end

  def down
    remove_column :users, :notify_via_app
    remove_column :users, :notify_via_sms
    remove_column :users, :notify_via_email
    remove_column :users, :turn_off_time
  end
end
