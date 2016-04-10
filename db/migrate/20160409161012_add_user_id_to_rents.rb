class AddUserIdToRents < ActiveRecord::Migration
  def change
    add_column :rents, :user_id, :integer
  end
end
