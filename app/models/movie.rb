class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.search_same_director(id)
    aux = Movie.find_by_id(id)
    mov = Movie.find_all_by_director(aux.director)
    if mov[0].director == nil  or mov[0].director==""
      return []
    else
      return mov
    end
  end

end
