require 'rails_helper'

RSpec.describe Actor do
  before :each do 
    @actor_1 = Actor.create!(name: 'Jeff', age: 22)
    @actor_2 = Actor.create!(name: 'Bob', age: 30)
    @actor_3 = Actor.create!(name: 'Jan', age: 1)
  end

  describe 'relationships' do
    it {should have_many :movies}
    it {should have_many :actor_movies}
  end
end
