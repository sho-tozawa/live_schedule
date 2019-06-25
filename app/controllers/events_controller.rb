class EventsController < ApplicationController
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @events }
      format.json { render :json => @events }
    end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end
end
