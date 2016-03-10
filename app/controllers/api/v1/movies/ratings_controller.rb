class Api::V1::Movies::RatingsController < ApplicationController
  before_action :authenticate_user!
  before_action :prepare_rating, only: [:update, :destroy]
  load_and_authorize_resource

  def create
    @rating = current_user.ratings.build(rating_params)
    if @rating.save
      render json: @rating.to_json
    else
      render json: @rating.errors.to_json, status: 500
    end
  end

  def update
    if @rating.update(rating_params)
      render json: @rating.to_json
    else
      render json: @rating.errors.to_json, status: 500
    end
  end

  def destroy
    render json: @rating.destroy
  end

  private

  def rating_params
    params.require(:rating).permit(:movie_id, :value)
  end

  def prepare_rating
    @rating = Rating.find(params[:id])
    unless @rating.present?
      render json: "Rating doesn't exist", status: 404
    end
  end
end