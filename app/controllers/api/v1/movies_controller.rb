class Api::V1::MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :prepare_movie, only: [:show, :update, :destroy]
  load_and_authorize_resource

  def index
    @movies = Movie.all.includes(:ratings)
    render json: @movies.to_json(methods: :rating)
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie.to_json
    else
      render json:  @movie.errors.to_json, status: 500
    end
  end

  def show
    render json: @movie.to_json(methods: :rating)
  end

  def update
    if @movie.update(movie_params)
      render json:  @movie.to_json
    else
      render json: @movie.errors.to_json, status: 500
    end
  end

  def destroy
    render json: @movie.destroy
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :photo, :cover_photo, :duration, :release_date, :genre_id, :photo_url, :cover_photo_url)
  end

  def prepare_movie
    @movie = Movie.find(params[:id])
    unless @movie.present?
      render json: "Movie doesn't exist", status: 404
    end
  end
end