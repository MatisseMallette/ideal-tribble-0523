require 'rails_helper'

RSpec.describe 'the movies show' do 
  before :each do 
    @studio_a = Studio.create!(name: 'Studio A', location: 'Bollywood')
    @studio_b = Studio.create!(name: 'Studio B', location: 'Hollywood')
    @movie_1 = @studio_a.movies.create!(title: 'Movie 1', creation_year: '1999', genre: 'Comedy')
    @movie_2 = @studio_b.movies.create!(title: 'Movie 2', creation_year: '2000', genre: 'Horror')
  end
end