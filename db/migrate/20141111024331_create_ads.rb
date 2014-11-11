class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :name
      t.string :picture

      t.timestamps
    end
  end
end
