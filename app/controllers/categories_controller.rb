class CategoriesController < ApplicationController

  layout false

  before_action :confirm_logged_in

    def index
      @categories = Category.sorted
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        flash[:notice] = 'New category created.'
        redirect_to(:action => 'index')
      else
        render("new")
      end
    end

    def edit
      @category = Category.find(params[:id])
    end

    def update
      @category = Category.find(params[:id])
      if @category.update_attributes(category_params)
        flash[:notice] = 'Category updated.'
        redirect_to(:action => 'index')
      else
        render("edit", :id => @category.id)
      end
    end

    def delete
      @category = Category.find(params[:id])
    end

    def destroy
      Category.find(params[:id]).destroy
      flash[:notice] = "Category destroyed."
      redirect_to(:action => 'index')
    end

    private

    def category_params
      params.require(:category).permit(:category_title)
    end

  end
