class AddCategoryIdToRents < ActiveRecord::Migration
  def change
    add_column :rents, :category_id, :integer
  end
end
