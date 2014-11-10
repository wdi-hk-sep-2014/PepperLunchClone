class Lunch < ActiveRecord::Base
  belongs_to :user

  def self.start_of_wdi
    Date.new(2014, 9, 22)
  end
end
