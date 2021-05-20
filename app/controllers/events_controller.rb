class EventsController < ApplicationController
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @user, status: 201
    else 
      render json: @user.errors, status: 400
    end
  end
end
