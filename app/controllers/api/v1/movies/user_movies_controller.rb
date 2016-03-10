class Api::V1::Movies::UserMoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :prepare_user_movie, only: [:update, :destroy]

  def index
    @user_movies = current_user.movies
    render json: @user_movies
  end

  def create
    @user_movie = current_user.user_movies.build(user_movie_params)
    if @user_movie.save
      render json: @user_movie
    else
      render json: @user_movie.errors
    end
  end

  def update
    if @user_movie.update(user_movie_params)
      render json: @user_movie
    else
      render json: @user_movie.errors
    end
  end

  def destroy
    render json: @user_movie.destroy
  end

  private

  def user_movie_params
    params.require(:user_movie).permit(:movie_id, :state)
  end

  def prepare_user_movie
    @user_movie = current_user.user_movies.where(movie_id: params[:id]).first
    unless @user_movie.present?
      render json: "User didn't add movie to list", status: 404
    end
  end

end