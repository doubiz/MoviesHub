class Api::V1::MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource

  def index
    @movies = Movie.all.includes(:ratings)
    render json: @movies.to_json(methods: :rating)
  end

  def create
    @movie = Movie.create(movie_params)
    render json: @movie ? @movie.to_json : @movie.errors.to_json
  end

  def show
    @movie = Movie.find(params[:id])
    render json: @movie.to_json(methods: :rating)
  end

  def update
    @movie = Movie.find(params[:id])
    render json: @movie.update(movie_params) ? @movie.to_json : @movie.errors.to_json
  end

  def destroy
    @movie = Movie.find(params[:id])
    render json: @movie.destroy
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :photo, :cover_photo, :duration, :release_date, :genre_id, :photo_url, :cover_photo_url)
  end
end