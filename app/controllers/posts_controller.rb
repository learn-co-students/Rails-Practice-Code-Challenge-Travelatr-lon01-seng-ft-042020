class PostsController < ApplicationController
    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        redirect_to @post
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to @post
    end

    def like 
        @post = Post.find(params[:id])
        @post.likes += 1
        @post.save
        redirect_to @post
    end

    private 

    def post_params
        params.require(:post).permit!
    end 
end
