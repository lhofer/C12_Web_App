class EntriesController < ApplicationController
    include EntriesHelper

    def index
        @entries = current_user.entries
    end
    
    def show
        @entry = Entry.find params[:id]
    end
    
    def new
        @entry = Entry.new
    end
    
    def create
        binding.pry
        @entry = current_user.entries.create(entries_params)
        binding.pry
        @entry.footprint = total_footprint(@entry)
        binding.pry
        if @entry.save
            redirect_to entries_path
        else 
            render 'new'
        end
    end
    
    def edit
        @entry = current_user.entries.find params[:id]
        render 'edit'
    end
    
    def update
        @entry = current_user.entries.find params[:id]
        @entry.footprint = total_footprint(@entry)
        
  		if @entry.update(entries_params)
   	    	redirect_to edit_entry_path(@entry)
   	    else 
   			render 'edit'
   		end
    end
    
    def charttest
        @entry = Entry.new
        @footprint = []
        @array = [["2010", 10], ["2020", 16], ["2030", 28]] 
        @data = 
            #{ name: 
            #data: @array }

            [
                 {
                     name: "Fantasy & Sci Fi", 
                     data: [["2010", 10], ["2020", 16], ["2030", 28]]
                 },
                 {
                     name: "Romance", 
                     data: [["2010", 24], ["2020", 22], ["2030", 19]]
                 },
                 {
                     name: "Mystery/Crime", 
                     data: [["2010", 20], ["2020", 23], ["2030", 29]]
                 }
            ]
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
