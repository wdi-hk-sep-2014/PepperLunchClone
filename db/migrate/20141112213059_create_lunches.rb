class CreateLunches < ActiveRecord::Migration
  def change
    create_table :lunches do |t|
      t.string :name      , default: 'PepperLunch'
      t.string :location  , default: 'Cyberport'
      t.date :lunch_date

      t.timestamps
    end
  end
end
