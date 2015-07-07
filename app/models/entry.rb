class Entry < ActiveRecord::Base
  belongs_to :user
   	validates :date, uniqueness: { case_sensitive: false }
	validates :num_people, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, :allow_nil => true
	validates :electricity, :natural_gas, :heating_oil, :mpg, :miles_driven, numericality: { greater_than_or_equal_to: 0 }, :allow_nil => true
end
