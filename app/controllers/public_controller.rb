class PublicController < ApplicationController

  def index
  end

  def show
  end

  def use_for_redirect
    redirect_to(:controller => 'ccontroller_name', :action => 'action_name')
  end

end
