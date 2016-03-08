class Api::V1::GenresController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  load_and_authorize_resource

  def index
    @genres = Genre.all
    render json: @genres
  end

  def create
    @genre = Genre.create(genre_params)
    render json: @genre ? @genre.to_json : @genre.errors.to_json
  end

  def update
    @genre = Genre.find(params[:id])
    render json: @genre.update(genre_params) ? @genre.to_json : @genre.errors.to_json
  end

  def destroy
    @genre = Genre.find(params[:id])
    render json: @genre.destroy
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end