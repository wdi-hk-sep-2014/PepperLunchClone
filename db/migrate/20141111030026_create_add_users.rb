class CreateAddUsers < ActiveRecord::Migration
  def change
    create_table :add_users do |t|

      t.timestamps
    end
  end
end
