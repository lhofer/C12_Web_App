module EntriesHelper
    
    def home_footprint(entry)
        if entry.electricity? && entry.natural_gas? && entry.heating_oil
            entry.electricity*electricity_efficiency(entry) + 
            entry.natural_gas*0.005 + 
    	    entry.heating_oil*10.15
        else
            0
        end
    end
        
    def car_footprint(entry)
        if entry.miles_driven && entry.mpg
            (entry.miles_driven/entry.mpg)*8.91
        else
            0
        end
    end
    
    def  diet_footprint(entry)
        if entry.diet_type?
            ((DietCarbon.find_by diet: entry.diet_type).carbon)/12
        else 
           0
           #((DietCarbon.find_by diet: "average").carbon)/12
        end
    end
    
    def total_footprint(entry)
        if entry.electricity? && entry.natural_gas? && entry.heating_oil && entry.miles_driven && entry.mpg && entry.diet_type?
            home_footprint(entry) + car_footprint(entry) + diet_footprint(entry)
        else
            "please enter all info for us to accurately calculate your carbon footprint!"
        end
    end
    
    def home_data(user, array)
        user.entries.map do |entry|
            if total_footprint(entry).is_a? Numeric
                array << [entry.date, home_footprint(entry)]
            else
                array << [entry.date, 0]
            end
        end
    end
    
    def car_data(user, array)
        user.entries.map do |entry|
            if total_footprint(entry).is_a? Numeric
                array << [entry.date, car_footprint(entry)]
            else
                array << [entry.date, 0]
            end
        end
    end
    
end
