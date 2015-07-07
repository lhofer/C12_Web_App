module DietCarbonsHelper
    def  diet_carbon_footprint(entry)
        if entry.diet_type?
            ((DietCarbon.find_by diet: entry.diet_type).carbon)/12
        else 
           ((DietCarbon.find_by diet: "average").carbon)/12
        end
    end
end