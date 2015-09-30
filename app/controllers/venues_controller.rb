class VenuesController < ApplicationController

  layout false

  before_action :confirm_logged_in

    def index
      @venues = Venue.sorted
    end

    def new
      @venue = Venue.new
    end

    def create
      @venue = Venue.new(venue_params)
      if @venue.save
        flash[:notice] = 'New venue created.'
        redirect_to(:action => 'index')
      else
        render("new")
      end
    end

    def edit
      @venue = Venue.find(params[:id])
    end

    def update
      @venue = Venue.find(params[:id])
      if @venue.update_attributes(venue_params)
        flash[:notice] = 'Venue updated.'
        redirect_to(:action => 'index')
      else
        render("edit", :id => @venue.id)
      end
    end

    def delete
      @venue = Venue.find(params[:id])
    end

    def destroy
      Venue.find(params[:id]).destroy
      flash[:notice] = "Venue destroyed."
      redirect_to(:action => 'index')
    end

    private

    def venue_params
      params.require(:venue).permit(:venue_name)
    end

  end
