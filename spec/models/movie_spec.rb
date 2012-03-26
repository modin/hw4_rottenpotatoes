require 'spec_helper'

describe Movie do
  describe Movie do
    fixtures :movies
    it 'should include all movies by director' do
      movie1 = movies(:mov1)   
      movie2 = movies(:mov2)   
      movie3 = movies(:mov3) #FactoryGirl.build(:movie, :title => 'Tres', :director => 'DirUno')
      Movie.search_same_director('5').should == [movie1, movie3]
      movie1.destroy
      movie2.destroy
      movie3.destroy
    end
    it 'should return [] when no director is defined' do
      movie1 = movies(:mov4)
      Movie.search_same_director('8').should == []
      movie1.destroy
    end   
 end
end
