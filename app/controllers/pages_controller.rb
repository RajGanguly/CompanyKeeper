class PagesController < ApplicationController
	def landing
		@company = Company.new
	end	
end
