class Api::V1::GenresController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :prepare_genre, only: [:update, :destroy]
  load_and_authorize_resource

  def index
    @genres = Genre.all
    render json: @genres
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      render json: @genre.to_json
    else
      render json: @genre.errors.to_json, status: 500
    end
  end

  def update
    if @genre.update(genre_params)
      render json: @genre.to_json
    else
      render json: @genre.errors.to_json, status: 500
    end
  end

  def destroy
    render json: @genre.destroy
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def prepare_genre
    @genre = Genre.find(params[:id])
    unless @genre.present?
      render json: "Genre doesn't exist", status: 404
    end
  end
end