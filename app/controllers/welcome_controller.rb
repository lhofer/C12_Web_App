class WelcomeController < ApplicationController
    def index
        @quad = RestClient.get("https://maps.googleapis.com/maps/api/distancematrix/json?origins=26+plympton+street+cambridge+ma&destinations=56+linnaean+street&mode=driving&language=en-EN&key=AIzaSyASWK9aumUuPhwdlez2QDOpGQyeEnc9ZbY")
    end
end