class PostsController < ApplicationController
    
    #Creates an instance variable that stores all post objects
    #Renders views/posts/index.html.erb
    def index
       @posts = Post.all
    end

    #Renders views/posts/new.html.erb
    #Note: @post argument in form_for cannot be nil
    def new
       @post = Post.new
    end

    #Create a new instance of the posts class
    #Using the values submitted by the user in the new.html.erb form
    #Check if the post is valid
    #If so redirect to the new instances show page
    #Otherwise redirect back to the form
    def create
       @post = Post.create(post_params)
      # byebug
       if @post.valid?
       redirect_to @post
       else 
        render :new
       end
    end

    #Creates an instance variable that stores a single post object
    #Use AR #find method & params to find the specfic object
    #via the id that is passed in the URL 
    #Renders views/posts/show.html.erb
    def show
       @post = Post.find(params[:id])
    end

    #Creates an instance variable that stores a single post object
    #Use AR #find method & params to find the specfic object
    #via the id that is passed in the URL 
    #Note: @post argument in form_for cannot be nil
    #Renders views/posts/edit.html.erb
    def edit
       @post = Post.find(params[:id])
    end

    #Creates an instance variable that stores a single post object
    #Use AR #find method & params to find the specfic object
    #via the id that is passed in the URL
    #Use AR #update method & post_params to update the instances attributes 
    #Redirect to the updated instances show page
    def update
       @post = Post.find(params[:id])
       @post.update(post_params)
       if @post.valid?
        redirect_to @post
        else 
         render :edit
        end
    end

    #Creates an instance variable that stores a single post object
    #Use AR #find method & params to find the specfic object
    #via the id that is passed in the URL
    #Use AR method #destroy to delete the instance from the database
    #Redirect to the index page
    def destroy
     @post = Post.find(params[:id])
     @post.destroy
     redirect_to posts_path
    end

    private
     #Strong params
     def post_params
        params.require(:post).permit(:title, :blogger_id, :destination_id, :content)
     end

end