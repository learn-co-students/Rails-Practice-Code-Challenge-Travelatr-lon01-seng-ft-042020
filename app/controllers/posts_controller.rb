class PostsController < ApplicationController
    def show
        @post = Post.find(params[:id])
    end

    def like 
        @post = Post.find(params[:id])
        @post.likes += 1
        @post.save
        redirect_to post_path(@post)
    end
end
