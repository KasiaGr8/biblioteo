class AddConfirmedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :confirmed, :boolean, default: false # z automatu będzie falsem
  end
end
