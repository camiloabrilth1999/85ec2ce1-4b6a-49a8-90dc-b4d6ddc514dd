class EventsController < ApplicationController
  before_action :set_actor, except: [:show, :find_events_actor, :index]
  before_action :set_repo, except: [:show, :find_events_actor, :index]

  def index
    @events = Event.all

    render :index, status: 200
  end

  def show
    @event = Event.find_by(id: params[:id])
    if @event
      render :show, status: 200
    else
      render json: {}, status: 404
    end
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: 201
    else 
      render json: @event.errors, status: 400
    end
  end

  def find_events_actor
    @actor = Actor.find_by_id(params["id"])
    @events = @actor.events unless @actor.nil?
    if @events
      render :find_events_actor, status: 200
    else
      render json: {}, status: 404
    end
    
  end

  private

  def event_params
    params.permit(:id).merge(actor_id: @actor.id, repo_id: @repo.id, event_type: params["type"], created_at: params["created_at"])
  end

  def set_repo
    @repo = Repo.create_with(name: params["repo"]["name"], url: params["repo"]["url"]).find_or_create_by(id: params["repo"]["id"])
  end

  def set_actor
    @actor = Actor.create_with(login: params["actor"]["login"], avatar_url: params["actor"]["avatar_url"]).find_or_create_by(id: params["actor"]["id"])
  end
end
