class CreateAddNewUsers < ActiveRecord::Migration
  def change
    create_table :add_new_users do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
