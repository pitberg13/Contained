class PublicController < ApplicationController

  layout false

  def index
    @event = Event.live
    @post = Post.published
    @featured_event = Event.featured
    @featured_post = Post.featured
  end

  def show
    @event = Events.where(:permalink => params[:permalink], :visible => true).first
    if @event.nil?
      redirect_to(:action => 'index')
    else

    end
    @post = Posts.where(:permalink => params[:permalink], :published => true).first
     if @post.nil?
    redirect_to(:action => 'index')
    else

    end
  end

  def use_for_redirect
    redirect_to(:controller => 'ccontroller_name', :action => 'action_name')
  end

end
