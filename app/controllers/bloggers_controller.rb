class BloggersController < ApplicationController
    
    #Creates an instance variable that stores all blogger objects
    #Renders views/blogger/index.html.erb
    def index
        @bloggers = Blogger.all
     end

    #Renders views/bloggers/new.html.erb
    #Note: @blogger argument in form_for cannot be nil
    def new
        @blogger = Blogger.new
     end
 
     #Create a new instance of the Bloggers class
     #Using the values submitted by the user in the new.html.erb form
     #Check if the blogger object is valid
     #If so redirect to the new instances show page
     #Otherwise redirect back to the form
     def create
        @blogger = Blogger.create(blogger_params)
        if @blogger.valid?
        redirect_to @blogger
        else 
         render :new
        end
     end
 
     #Creates an instance variable that stores a single blogger object
     #Use AR #find method & params to find the specfic object
     #via the id that is passed in the URL 
     #Renders views/bloggers/show.html.erb
     def show
        @blogger = Blogger.find(params[:id])
     end

     private
     #Strong params
     def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
     end

end