require 'rails_helper'

RSpec.describe Movie do
  before :each do 
    @studio = Studio.create!(name: 'Hollywood', location: 'Hollywood')
    @movie = @studio.movies.create!(title: 'Movie', creation_year: '2009', genre: 'Fantasy')
    @actor_1 = @movie.actors.create!(name: 'Jeff', age: 22)
    @actor_2 = @movie.actors.create!(name: 'Bob', age: 30)
    @actor_3 = @movie.actors.create!(name: 'Jan', age: 1)
  end

  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many :actors}
  end

  describe 'instance methods' do 
    describe '.actors_by_age_asc' do 
      it 'returns actors ordered from youngest to oldest' do 
        expect(@movie.actors_by_age_asc.to_a).to eq([@actor_3, @actor_1, @actor_2])
      end
    end

    describe '#avg_actor_age' do 
      it 'returns the average age' do 
        expect(@movie.avg_actor_age.to_f).to eq(17.6666666666666667)
      end
    end
  end
end
