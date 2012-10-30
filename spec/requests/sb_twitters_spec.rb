require 'spec_helper'
require 'date'

describe "Smashing Boxes Twitter Search" do

	describe "Search Page"
		:base = '/?utf8=✓&search='
		
		:s = :base +'hello '*200
  		it "should handle queries that are too long" do
  			visit :s
  		  	page.should have_selector('h3', :text => "-- That's a great question... Smaller chunks please... --")
  		end

  		it "should handle blank queries" do
  			visit :base +'hello '*200+'       '
  			page.should have_selector('h3', :text => "-- There's a bunch of tweets here. They just look like the query --")
  		end

  		it "should handle Twitter Exceptions" do
  			visit :base +'hello '*200+'abcdef'*4
  			page.should have_selector('h3', :text => "-- Oops. Something went wrong. Try another query. --")
  		end

  		it "should handle empty results" do
  			d = Date::today
  			d = Date.new(d.year+1,1,1)
  			visit :base +'hello '*200+'Twitter '+'since:'+d.to_s
  			page.should have_selector('h3', :text => "-- Looks like it isn't a popular topic. Nothing there. --")
  		end

  	end
end