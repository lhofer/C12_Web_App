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
        @entry = current_user.entries.create(entries_params)
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
  		if @entry.update(entries_params)
   	    	redirect_to edit_entry_path(@entry)
   	    else 
   			render 'edit'
   		end
    end
    
    def charttest
        @entry = Entry.new
        @car_data = []
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
