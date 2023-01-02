class MoviesController < ApplicationController
  def show 
    @movie = Movie.find(params[:id])
    @actors = @movie.actors_by_age_asc 
  end
end