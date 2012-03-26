Given /the following movies exist:$/ do |movies_table|
  movies_table.hashes.each do |movie|
  Movie.create!(movie)
  end
end

Then /the director of "(.*)" should be "(.*)"$/ do |movie, director|
  assert (page.body.to_s =~ /#{director}/)
end

#Given /^I am on the details page for "(.*)"$/ do |movie|
#end
