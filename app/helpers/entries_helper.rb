module EntriesHelper

#-------------------FOOTPRINT CALCULATIONS-------------------#    
    
    # check if fields exit
    def home_data?(entry)
        entry.electricity? && entry.natural_gas? && entry.heating_oil?
    end
    
    def car_data?(entry)
        entry.miles_driven && entry.mpg
    end
    
    # def diet_data? unecessary because only one param to check
    
    # calculate value of fields
    def calc_home_data(entry)
        (entry.electricity*electricity_efficiency(entry) + 
        entry.natural_gas*11.02 + 
	    entry.heating_oil*22.37).round(2)
	end
	
	def calc_car_data(entry)
	    ((entry.miles_driven/entry.mpg)*19.64).round(2)
    end
    
    def calc_diet_data(entry)
        ((((DietCarbon.find_by diet: entry.diet_type).carbon)/12)*2204.62).round(2)
    end
	
	# calculate average more
	def avg_home_data
	    ((4401/12*1.23)+(311/12*11.02)+(284/12*22.37)).round(2)
	end
	
	def avg_car_data
	    (((14425/12) / 16.95) * 19.64).round(2)
	end
	
	def avg_diet_data
	    (((DietCarbon.find_by diet: "average").carbon)/12*2204.62).round(2)
	end
    
    # Home Footprint Calculation
    def home_footprint(entry)
        if home_data?(entry)
            calc_home_data(entry).round(2)
        else
            avg_home_data.round(2)
        end
    end
    
    # Car Footprint Calculation    
    def car_footprint(entry)
        if car_data?(entry)
            calc_car_data(entry).round(2)
        else
            avg_car_data.round(2)    
        end
    end
    
    # Diet Footprint Calculation
    def  diet_footprint(entry)
        if entry.diet_type?
            calc_diet_data(entry).round(2)
        else 
            avg_diet_data.round(2)
        end
    end

    # Total Footprint Calculation
    def total_footprint(entry)
        if home_data?(entry) && car_data?(entry) && entry.diet_type?
            home_footprint(entry) + car_footprint(entry) + diet_footprint(entry).round(2)
        else
            0
        end
    end
    
#-------------------BARCHART DATA-------------------#    
    # Gen Home Data Array [[date, footprint]]
    def home_data(user, array)
        user.entries.map do |entry|
            if home_data?(entry)
                array << [entry.date, home_footprint(entry)]
            else
                # US average kWh*lbs_CO2/kWh + therms*lbs_CO2/therm + gal*lbs_CO2/gal (from carbonfund.org)
                array << [entry.date, avg_home_data]
            end
        end
    end
    
    # Gen Car Data Array [[date, footprint]]
    def car_data(user, array)
        user.entries.map do |entry|
            if car_data?(entry)
                array << [entry.date, car_footprint(entry)]
            else
                # US average ((miles/licensed_driver) / (miles/gal))*lbs_CO2/gal (from fhwa.dot.gov)
                array << [entry.date, avg_car_data]
            end
        end
    end
    
    # Gen Diet Data Array [[date, footprint]]
    def diet_data(user, array)
        user.entries.map do |entry|
            if entry.diet_type?
                array << [entry.date, diet_footprint(entry)]
            else
                array << [entry.date, avg_diet_data]
            end
        end
    end
    
#-------------------BARCHART DATA-------------------#    
    # Gen Month Data Array
    def all_data(entry, array)
      #HOME
        if home_data?(entry)
            array[0][1]=array[0][1] + home_footprint(entry)
        else
            # US average kWh*lbs_CO2/kWh + therms*lbs_CO2/therm + gal*lbs_CO2/gal (from carbonfund.org)
            array[0][1]=array[0][1] + avg_home_data
        end
      #CAR
        if entry.miles_driven && entry.mpg
            array[1][1]=array[1][1] + car_footprint(entry)
        else
            # US average ((miles/licensed_driver) / (miles/gal))*lbs_CO2/gal (from fhwa.dot.gov)
            array[1][1]=array[1][1] + avg_car_data
        end
      #DIET    
        if entry.diet_type?
            array[2][1]=array[2][1] + diet_footprint(entry)
        else
            array[2][1]=array[2][1] + avg_diet_data
        end
    end
    
        # Gen Month Data Array
    def average_data(array)
      #HOME
        # US average kWh*lbs_CO2/kWh + therms*lbs_CO2/therm + gal*lbs_CO2/gal (from carbonfund.org)
        array[0][1]=array[0][1] + avg_car_data
      #CAR
        # US average ((miles/licensed_driver) / (miles/gal))*lbs_CO2/gal (from fhwa.dot.gov)
        array[1][1]=array[1][1] + avg_car_data
      #DIET    
        array[2][1]=array[2][1] + avg_diet_data
    end
end
