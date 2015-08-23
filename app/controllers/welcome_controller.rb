class WelcomeController < ApplicationController
    before_action :authenticate_user!, except: [:index, :about, :contact, :map]
    def index
        # @distance_matrix = RestClient.get("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{params[:origin]}&destinations=#{params[:destination]}&mode=driving&language=en-EN&key=AIzaSyASWK9aumUuPhwdlez2QDOpGQyeEnc9ZbY")
        # @distance_matrix2 = RestClient.get("https://maps.googleapis.com/maps/api/distancematrix/json?origins=toronto&destinations=montreal&mode=driving&language=en-EN&key=AIzaSyASWK9aumUuPhwdlez2QDOpGQyeEnc9ZbY")
    end
    
    def about
    end
    
    def contact
    end
    
    def start
    end

    def map
    end
end
