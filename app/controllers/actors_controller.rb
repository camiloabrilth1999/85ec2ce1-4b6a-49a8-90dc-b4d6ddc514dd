class ActorsController < ApplicationController
  before_action :load_actor, only: :update

  def index
    @actors = Actor.all

    render :index, status: 200
  end

  def update
    if @actor.nil?
      render json: {}, status: 400
    else
      @actor.update(actor_params)
      if params["login"] != @actor.login
        render json: {}, status: 400
      else
        render json: @actor, status: 200
      end
    end
  end

  private

  def actor_params
    params.permit(:avatar_url)
  end

  def load_actor
    @actor = Actor.find_by_id(params["id"])
  end
end
