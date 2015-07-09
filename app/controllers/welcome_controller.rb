class WelcomeController < ApplicationController
    def index
        distance_matrix = JSON.load(RestClient.get("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{params[:origin]}&destinations=#{params[:destination]}&mode=driving&language=en-EN&key=AIzaSyASWK9aumUuPhwdlez2QDOpGQyeEnc9ZbY"))
        if distance_matrix["rows"][0]
            @distance = distance_matrix["rows"][0]["elements"][0]["distance"]["value"]
            @km = distance_matrix["rows"][0]["elements"][0]["distance"]["text"]
            @carbon_load = ((@distance*1.61) / 36) *19.64
        end
    end
    
    def about

    end
    
    def contact
    end
end