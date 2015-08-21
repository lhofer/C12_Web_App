class Entry < ActiveRecord::Base
  #include ActionView::Helpers::DietCarbonsHelper
  
  belongs_to :user
  validates :date, uniqueness: { scope: :user_id }
	validates :num_people, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, :allow_nil => true
	validates :electricity, :natural_gas, :heating_oil, :mpg, :miles_driven, numericality: { greater_than_or_equal_to: 0 }, :allow_nil => true

    # see https://stackoverflow.com/questions/15520114/how-to-save-calculated-age-in-database-after-save-or-before-save
    # before_save :set_footprint
    
    # def set_footprint
    #     self.diet_carbon = diet_carbon_footprint(self)
    # end
    
    # attr_accessible :num_people
    # attr_accessor :num_people_2

    # def num_people_2
    #     num_people * 2
    # end
    
end