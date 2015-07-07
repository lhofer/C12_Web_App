module StateElectricitiesHelper
    def  electricity_efficiency(entry)
        if entry.state?
            (StateElectricity.find_by state: entry.state).carbon
        else
            (StateElectricity.find_by state: "MI").carbon
        end
    end
end


