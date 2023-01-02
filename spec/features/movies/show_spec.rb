require 'rails_helper'

RSpec.describe 'the movies show' do 
  before :each do 
    @studio_a = Studio.create!(name: 'Studio A', location: 'Bollywood')   
    @movie_1 = @studio_a.movies.create!(title: 'Movie 1', creation_year: '1999', genre: 'Comedy')
    @actor_1 = @movie_1.actors.create!(name: 'Jeff', age: 22)
    @actor_2 = @movie_1.actors.create!(name: 'Bob', age: 30)
    @actor_3 = @movie_1.actors.create!(name: 'Jan', age: 1)
  end

  it 'displays a films information, a list of its actors and each of their information' do 
    visit "/movies/#{@movie_1.id}" 
    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_1.creation_year)
    expect(page).to have_content(@movie_1.genre)
    expect(@actor_3.name).to appear_before(@actor_1.name)
    expect(@actor_1.name).to appear_before(@actor_2.name)
    expect(page).to have_content("Average age of actors: 17.6666666666666667")
  end
end