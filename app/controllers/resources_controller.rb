class ResourcesController < ApplicationController
  def delete
    Event.destroy_all
    Actor.destroy_all
    Repo.destroy_all

    render json: {}, status: 200
  end
end
