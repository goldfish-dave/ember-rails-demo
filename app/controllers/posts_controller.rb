class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :json => @posts
  end

  def show
    @post = Post.find(params[:id])
    render :json => @post
  end

  def create
    @post = Post.create(params[:post])
    render :json => @post
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    render :json => @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    head :ok
  end
end
