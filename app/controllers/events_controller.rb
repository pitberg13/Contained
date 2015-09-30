class EventsController < ApplicationController

  before_action :confirm_logged_in

  layout false

  #before_action :find_venue
  #before_action :find_category

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @event_count = Event.count + 1
    @venues = Venue.all
    @categories = Category.all
  end

  def create
    @event = Event.new(event_params)
    @venues = Venue.all
    @categories = Category.all
    if @event.save
      flash[:notice] = "New event created successfully."
      redirect_to(:action => 'index')
    else
      @event_count = Event.count + 1
      render('new')
    end
  end

  def edit
    @event = Event.find(params[:id])
    @event_count = Event.count
    @venues = Venue.all
    @categories = Category.all
  end

  def update
    @event = Event.find(params[:id])
    @venues = Venue.all
    @categories = Category.all
    if @event.update_attributes(event_params)
      flash[:notice] = "Event updated successfully."
      redirect_to(:action => 'index')
    else
      @event_count = Event.count
      render('edit')
    end
  end

  def delete
    @event = Event.find(params[:id])
  end

  def destroy
    event = Event.find(params[:id]).destroy
    flash[:notice] = "#{event.title}  trashed."
    redirect_to(:action => 'index')
  end


  private

    def event_params
      params.require(:event).permit(:category_id, :venue_id, :title, :image, :visible, :content, :event_datetime, :ticket_price, :featured, :permalink, :position)
    end

end
