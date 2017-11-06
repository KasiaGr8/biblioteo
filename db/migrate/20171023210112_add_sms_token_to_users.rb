class AddSmsTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sms_token, :string
  end
end
