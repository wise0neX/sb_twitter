require './croaky-twitter-search-7523a39/lib/twitter_search.rb'

@@client = TwitterSearch::Client.new 'smashing_boxes_demo'

class Search < ActiveRecord::Base
  def self.search(query,page=1)
  	@tweets = @@client.query :q => query, :page => page
  end
end