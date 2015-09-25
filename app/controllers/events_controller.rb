class EventsController < ApplicationController

  #before_action :confirm_logged_in

  def index
    @events = Event.sorted
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new({:page_id => @page.id, :name => "Default"})
    @pages = @page.subject.pages.sorted
    @section_count = Section.count + 1
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event created successfully."
      redirect_to(:action => 'index')
    else
      @event_count = Section.count + 1
      render('new')
    end
  end

  def edit
    @event = Event.find(params[:id])
    @event_count = Event.count
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:notice] = "event updated successfully."
      redirect_to(:action => 'ndex')
    else
      @event_count = Section.count
      render('edit')
    end
  end

  def delete
    @event = Event.find(params[:id])
  end

  def destroy
    event = Event.find(params[:id]).destroy
    flash[:notice] = "Event trashed."
    redirect_to(:action => 'index')
  end


  private

    def section_params
      params.require(:section).permit(:category_id, :venue_id, :title, :image, :visible, :content, :event_datetime, :ticket_price, :featured, :permalink, :excerpt)
    end

end
