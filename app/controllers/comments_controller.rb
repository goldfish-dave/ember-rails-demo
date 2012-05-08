class CommentsController < ApplicationController
  def index
    # sucks, I can't nest these yet
    if ids = params[:ids]
      @comments = Comment.where(:id => ids)
    else
      @comments = Comment.where(:post_id => params[:post_id])
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.json { render json: nil, status: :ok }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.json { render json: nil, status: :ok }
    end
  end
end
