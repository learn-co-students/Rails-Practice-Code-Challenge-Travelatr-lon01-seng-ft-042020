class DestinationsController < ApplicationController
     
    #Creates an instance variable that stores a single destination object
    #Use AR #find method & params to find the specfic object
    #via the id that is passed in the URL 
    #Renders views/destinations/show.html.erb
    def show
        @destination = Destination.find(params[:id])
    end
  
end