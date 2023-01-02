class Actor < ApplicationRecord
  has_many :actor_movies 
  has_many :movies, through: :actor_movies  

  # def self.order_by_age_desc
  #   find_by_sql('SELECT * FROM actors ORDER BY name DESC')
  # end

end
