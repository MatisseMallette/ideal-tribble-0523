require 'rails_helper'

RSpec.describe 'the studio index' do 
  before :each do 
    @studio_a = Studio.create!(name: 'Studio A', location: 'Bollywood')
    @studio_b = Studio.create!(name: 'Studio B', location: 'Hollywood')
    @movie_1 = @studio_a.movies.create!(title: 'Movie 1', creation_year: '1999', genre: 'Comedy')
    @movie_2 = @studio_b.movies.create!(title: 'Movie 2', creation_year: '2000', genre: 'Horror')
  end

  it 'displays a list of all studios, their names, locations, and movies, and under the movies I see their title, year of creation and genre' do
    visit "/studios"
    expect(page).to have_content(@studio_a.name)
    expect(page).to have_content(@studio_a.location)
    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_1.creation_year)
    expect(page).to have_content(@movie_1.genre)
    expect(page).to have_content(@studio_b.name)
    expect(page).to have_content(@studio_b.location)
    expect(page).to have_content(@movie_2.title)
    expect(page).to have_content(@movie_2.creation_year)
    expect(page).to have_content(@movie_2.genre)
    
  end
end