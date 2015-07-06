class EntriesController < ApplicationController
    
    
    def index
        @entries = current_user.entries
    end
    
    def show
        
    end
    
    def new
    end
    
    def create
    end
    
    def edit 
    end
    
    def update
    end
    
    def destroy
    end
end
