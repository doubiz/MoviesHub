class Api::V1::Movies::RatingsController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  load_and_authorize_resource

  def create
    @rating = current_user.ratings.create(rating_params)
    render json: @rating.persisted? ? @rating.to_json : @rating.errors.to_json
  end

  def update
    @rating = Rating.find(params[:id])
    render json: @rating.update(rating_params) ? @rating.to_json : @rating.errors.to_json
  end

  def destroy
    @rating = Rating.find(params[:id])
    render json: @rating.destroy
  end

  private

  def rating_params
    params.require(:rating).permit(:movie_id, :value)
  end
end