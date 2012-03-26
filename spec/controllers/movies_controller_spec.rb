require 'spec_helper'

describe MoviesController do
  describe 'find movies with same director' do
    before :each do
      @fake_results = [mock('Movie'), mock('Movie')]
    end
    it 'should call the model method that performs the search by director' do
      Movie.should_receive(:search_by_director).with('George Lucas').and_return(@fake_results)
      get :find_by_director, {:director => 'George Lucas'}
    end
    describe 'after valid search' do
      before :each do
        Movie.stub(:search_by_director).and_return(@fake_results)
        get :find_by_director, {:director => 'George Lucas'}
      end
      it 'should select the find_by_director template to render' do
        response.should render_template('find_by_director')
      end
      it 'should make the search results available to that template (by means of setting instance vble)' do
        assigns(:movies).should == @fake_results
      end
    end
  end
end
