class DashboardController < ApplicationController
  before_filter :authenticate_user!

	def myChallenge
		render :layout => false
	end
	
	def whatsNew
		render :layout => false
	end
	
	def message
		render :layout => false
	end
	
	def dashboardIndex
		render :layout => false
	end
	
	def against_others
		render :layout => false
	end
	def against_myself
		render :layout => false
	end
  
end