class CreateRents < ActiveRecord::Migration
  def change
    create_table :rents do |t|
      t.string :location
      t.string :ownername
      t.string :types
      t.integer :contact
      t.decimal :price
      t.text :description

      t.timestamps null: false
    end
  end
end
