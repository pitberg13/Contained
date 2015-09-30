class PostsController < ApplicationController

  before_action :confirm_logged_in

  layout 'admin'

  #mount_uploader :image, PictureUploader


  def index
    @posts = Post.sorted
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @post_count = Post.count + 1
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "You created a post. It better be good..."
      redirect_to(:action => 'index')
    else
      @post_count = Post.count + 1
      render('new')
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
    @post_count = Post.count
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "Bad grammar and sloppy typing updated."
      redirect_to(:action => 'index')
    else
      @post_count = Post.count
      render('edit', :id => @post.id)
    end
  end

  def delete
    @post = Post.find_by_id(params[:id])
  end

  def destroy
    event = Post.find_by_id(params[:id]).destroy
    flash[:notice] = "That bad?"
    redirect_to(:action => 'index')
  end


  private

    def post_params
      params.require(:post).permit(:title, :permalink, :image, :published, :featured, :position, :content, :bootsy_image_gallery_id)
    end

  end
