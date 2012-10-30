require 'spec_helper'
require 'date'

describe "Smashing Boxes Twitter Search" do

	describe "Search Page"

  		it "should handle queries that are too long" do
  			visit '/'
  			fill_in 'search', :with => 'hello '*200
  			click_button 'Search'
  		  	page.should have_selector('h3', :text => "-- That's a great question... Smaller chunks please... --")
  		end

  		it "should handle blank queries" do
  			visit '/'
  			fill_in 'search', :with => '      '
  			click_button 'Search'
  			page.should have_selector('h3', :text => "-- There's a bunch of tweets here. They just look like the query --")
  		end

  		it "should handle Twitter Exceptions" do
  			visit '/'
  			fill_in 'search', :with => 'abcdef'*4
  			page.should have_selector('h3', :text => "-- Oops. Something went wrong. Try another query. --")
  		end

  		it "should handle empty results" do
  			d = Date::today
  			d = Date.new(d.year+1,1,1)
  			visit '/'
  			fill_in 'search', :with => 'Twitter '+'since:'+d.to_s
  			page.should have_selector('h3', :text => "-- Looks like it isn't a popular topic. Nothing there. --")
  		end

  	end
end