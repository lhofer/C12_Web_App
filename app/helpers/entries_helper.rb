module EntriesHelper

#-------------------FOOTPRINT CALCULATIONS-------------------#    
    # Home Footprint Calculation
    def home_footprint(entry)
        if entry.electricity? && entry.natural_gas? && entry.heating_oil
            entry.electricity*electricity_efficiency(entry) + 
            entry.natural_gas*0.005 + 
    	    entry.heating_oil*10.15
        else
            (4401/12*1.23)+(311/12*11.02)+(284/12*22.37)
        end
    end
    
    # Car Footprint Calculation    
    def car_footprint(entry)
        if entry.miles_driven && entry.mpg
            (entry.miles_driven/entry.mpg)*8.91
        else
            (14425/16.95)*8.19
        end
    end
    
    # Diet Footprint Calculation
    def  diet_footprint(entry)
        if entry.diet_type?
            ((DietCarbon.find_by diet: entry.diet_type).carbon)/12
        else 
           ((DietCarbon.find_by diet: "average").carbon)/12
        end
    end

    # Total Footprint Calculation
    def total_footprint(entry)
        if entry.electricity? && entry.natural_gas? && entry.heating_oil && entry.miles_driven && entry.mpg && entry.diet_type?
            home_footprint(entry) + car_footprint(entry) + diet_footprint(entry)
        else
            "please enter all info for us to accurately calculate your carbon footprint!"
        end
    end
    
#-------------------BARCHART DATA-------------------#    
    # Gen Home Data Array [[date, footprint]]
    def home_data(user, array)
        user.entries.map do |entry|
            if entry.electricity? && entry.natural_gas? && entry.heating_oil
                array << [entry.date, home_footprint(entry)]
            else
                # US average kWh*lbs_CO2/kWh + therms*lbs_CO2/therm + gal*lbs_CO2/gal (from carbonfund.org)
                array << [entry.date, (4401/12*1.23)+(311/12*11.02)+(284/12*22.37)]
            end
        end
    end
    
    # Gen Car Data Array [[date, footprint]]
    def car_data(user, array)
        user.entries.map do |entry|
            if entry.miles_driven && entry.mpg
                array << [entry.date, car_footprint(entry)]
            else
                # US average ((miles/licensed_driver) / (miles/gal))*lbs_CO2/gal (from fhwa.dot.gov)
                array << [entry.date, (14425/16.95)*8.19]
            end
        end
    end
    
    # Gen Diet Data Array [[date, footprint]]
    def diet_data(user, array)
        user.entries.map do |entry|
            if entry.diet_type?
                array << [entry.date, diet_footprint(entry)*2204.62]
            else
                array << [entry.date, ((DietCarbon.find_by diet: "average").carbon)*2204.62/12]
            end
        end
    end
    
#-------------------BARCHART DATA-------------------#    
    # Gen Month Data Array
    def month_data(entry, array)
      #HOME
        if entry.electricity? && entry.natural_gas? && entry.heating_oil
            array << ["Home", home_footprint(entry)]
        else
            # US average kWh*lbs_CO2/kWh + therms*lbs_CO2/therm + gal*lbs_CO2/gal (from carbonfund.org)
            array << ["Home", (4401/12*1.23)+(311/12*11.02)+(284/12*22.37)]
        end
      #CAR
        if entry.miles_driven && entry.mpg
            array << ["Car", car_footprint(entry)]
        else
            # US average ((miles/licensed_driver) / (miles/gal))*lbs_CO2/gal (from fhwa.dot.gov)
            array << ["Car", (14425/16.95)*8.19]
        end
      #DIET    
        if entry.diet_type?
            array << ["Diet", diet_footprint(entry)*2204.62]
        else
            array << ["Diet", ((DietCarbon.find_by diet: "average").carbon)*2204.62/12]
        end
    end
end
