class SearchController < ApplicationController
	def index

		@query =  params[:search]

		if @query.to_s.length > 999
			@tweets = :too_long

		elsif @query.to_s.blank?
			params[:search] = nil
			@tweets = nil

		else
			@tweets = Search.search(@query)

		end
	end
end
