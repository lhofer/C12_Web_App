module EntriesHelper
    def total_footprint(entry)
        if entry.electricity? && entry.natural_gas? && entry.heating_oil && entry.miles_driven && entry.mpg
            entry.electricity*electricity_efficiency(entry) + 
            entry.natural_gas*0.005 + 
    	    entry.heating_oil*10.15 + 
    	    (entry.miles_driven/entry.mpg)*8.91 + 
            diet_carbon_footprint(entry)
        else
            "please enter all info for us to accurately calculate your carbon footprint!"
        end
    end
end
