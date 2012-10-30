class SearchController < ApplicationController
	def index

		params[:search].strip!
		@query =  params[:search]

		if @query.to_s.length > 999
			@tweets = :too_long

		elsif @query.to_s.blank?
			params[:search] = nil
			@tweets = :blank

		else
			begin
				@tweets = Search.search(@query)
			rescue
				@tweets = :error
			end
		end
	end
end
