class AddColumnsInUser < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :sex, :integer
    add_column :users, :city, :string
    add_column :users, :zip_code, :string
    add_column :users, :username, :string, null: false
    add_column :users, :security_question, :integer
    add_column :users, :security_answer, :string
    add_column :users, :access_token, :string
    add_column :users, :device_token, :string
    add_column :users, :status, :integer
    add_column :users, :is_active, :boolean, default: true
    add_column :users, :notify_sms, :boolean, default: true
    add_column :users, :notify_email, :boolean, default: true
    add_column :users, :notify_new_msg, :boolean, default: true
    add_column :users, :meet_now, :boolean, default: false
    add_column :users, :logged_day, :integer
    add_column :users, :is_disable, :boolean, default: false
  end

  def down
    remove_column :users, :name
    remove_column :users, :age
    remove_column :users, :sex
    remove_column :users, :city
    remove_column :users, :zip_code
    remove_column :users, :username
    remove_column :users, :security_question
    remove_column :users, :security_answer
    remove_column :users, :access_token
    remove_column :users, :device_token
    remove_column :users, :status
    remove_column :users, :is_active
    remove_column :users, :notify_sms
    remove_column :users, :notify_email
    remove_column :users, :notify_new_msg
    remove_column :users, :meet_now
    remove_column :users, :logged_day
    remove_column :users, :is_disable
  end
end
