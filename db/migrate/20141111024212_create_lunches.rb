class CreateLunches < ActiveRecord::Migration
  def change
    create_table :lunches do |t|
      t.string :day
      t.integer :happiness_level

      t.timestamps
    end
  end
end
