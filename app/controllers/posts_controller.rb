class PostsController < ApplicationController

  #before_action :confirm_logged_in

  layout false


  def index
    @posts = Post.sorted
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = post.new
    @post_count = Post.count + 1
  end

  def create
    @post = Post.new(event_params)
    if @post.save
      flash[:notice] = "Post saved successfully."
      redirect_to(:action => 'index')
    else
      @post_count = Post.count + 1
      render('new')
    end
  end

  def edit
    @post = Post.find(params[:id])
    @post_count = Post.count
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(event_params)
      flash[:notice] = "Post updated successfully."
      redirect_to(:action => 'ndex')
    else
      @post_count = Post.count
      render('edit')
    end
  end

  def delete
    @post = Post.find(params[:id])
  end

  def destroy
    event = Post.find(params[:id]).destroy
    flash[:notice] = "Event trashed."
    redirect_to(:action => 'index')
  end


  private

    def section_params
      params.require(:post).permit(:title, :image, :published, :permalink, :content, :featured, :position)
    end

  end
