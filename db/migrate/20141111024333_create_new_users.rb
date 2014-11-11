class CreateNewUsers < ActiveRecord::Migration
  def change
    create_table :new_users do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
