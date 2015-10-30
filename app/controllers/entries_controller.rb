class EntriesController < ApplicationController
    include EntriesHelper
    before_action :authenticate_user!

    def index
        @entries = current_user.entries
        @entry = Entry.new
        @home_data = []
        @car_data = []
        @total_footprint = 0
        @diet_data = []
        @average_data = [["home", 0], ["car", 0], ["diet", 0]]    
    end
    
    def show
        @entry = Entry.find params[:id]
    end
    
    def new
        @entry = Entry.new
    end
    
    def create
        @entry = current_user.entries.create(entries_params)
        if @entry.save
            redirect_to entries_path
        else 
            render 'new'
        end
    end
    
    def edit
        @entry = current_user.entries.find params[:id]
    end
    
    def update
        @entry = current_user.entries.find params[:id]
  		if @entry.update(entries_params)
   	    	redirect_to entries_path
   	    else 
   			render 'edit'
   		end
    end
    
    def charttest
        @entries = current_user.entries
        @entry = Entry.new
        @home_data = []
        @car_data = []
        @diet_data = []
        @pie_data = [["home", 0], ["car", 0], ["diet", 0]]
        @average_data = [["home", 0], ["car", 0], ["diet", 0]]

    end
    
    def destroy
        entry = current_user.entries.find params[:id]
	 	entry.destroy
	 	redirect_to entries_path
    end
    
    private
        def entries_params
            params.require(:entry).permit(:num_people, :state, :electricity, :natural_gas, :heating_oil, :miles_driven, :mpg, :date, :diet_type)
        end
end
