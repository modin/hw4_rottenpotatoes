class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.search_same_director(id)
    aux = Movie.find_by_id(id)
#    if aux == nil do
#      end
#    else
      Movie.find_all_by_director(aux.director)
#    end
  end

end
